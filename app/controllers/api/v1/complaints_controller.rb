# frozen_string_literal: true

module Api
  module V1
    class ComplaintsController < Api::V1::ApiController
      before_action :set_complaint, except: %i[create index]
      before_action :authenticate_user

      def create
        @complaint = Complaint.new(complaint_params.merge(user: current_user))
        if @complaint.save
          render json: @complaint, status: :created
        else
          render json: { errors: @complaint.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @complaint
      end

      def destroy
        @complaint.destroy
      end

      def update
        if @complaint.update(complaint_params)
          self.check_adopted_measure_exists?(complaint_params[:adopted_measure])
          render json: @complaint
        else
          render json: { errors: @complaint.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def check_adopted_measure_exists?(adopted_measure) 
        unless adopted_measure.nil?
          unless adopted_measure.empty?
            change_status = @complaint.status + 1
            @complaint.update(status: change_status)
          end
        end
      end

      def index
        @complaints = Complaint.paginate(page: params[:page] || 1)
        filter_by_description if params[:query]
        render json: @complaints
      end

      private

      def filter_by_description
        @complaints = @complaints.select do | complaint | 
          complaint.description == params[:query]  
        end  
      end

      def set_complaint
        @complaint = Complaint.find(params[:id])
      end

      def complaint_params
        params.require(:complaint).permit(:description, :latitude, :longitude,
          :adopted_measure, :status)
      end
    end
  end
end
