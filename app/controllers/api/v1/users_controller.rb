# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :authenticate_user, only: %i[current update update_password]
      before_action :set_user, only: %i[show update]
      before_action :set_user_valid?, only: %i[update_password forgot_password]
      load_and_authorize_resource except: %i[create forgot_password reset_password]

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def current
        render json: current_user
      end

      def show
        render json: @user
      end

      def update_password
        begin
          if @user.authenticate(params[:password])
            @user.update(password: params[:new_password])
            render json: {user: @user, success: "User #{@user.name} successfully change password!"}, status: :created
          else
            render json: { errors: 'Check your current password!' }, status: :unprocessable_entity
          end
        rescue 
          render json: { errors: "User not found!" }, status: :unprocessable_entity
        end
      end


      def forgot_password
        if @user.present?
          @user.generate_password_token
          render json: {user: @user.email, token_reset: @user.reset_password_token}, status: :created
        else
          render json: {errors: 'Email address not found!'}, status: :not_found
        end
      end


      def reset_password
        token = params[:token].to_s
    
        if params[:email].blank?
          return render json: {errors: 'Token not informed!'}
        end

        user = User.find_by(reset_password_token: token)
        if user.present? && user.password_token_valid?
          if user.reset_password(params[:password])
            render json: {user: user.email, success: "User #{user.name} successfully reset password!" }, status: :created
          else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
          end
        else
          render json: {errors:  'Link not valid or expired'}, status: :not_found
        end
      end

      private

      def set_user_valid?
        if params[:email].blank?
          render json: {errors: 'Email not informed!'}
        end
        @user = User.find_by(email: params[:email])
      end


      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
