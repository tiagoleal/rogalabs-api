# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'user_token', to: 'user_token#create'
      resources :complaints, only: %i[index show create update destroy]
      post 'users/password/change', to: 'users#update_password'
      post 'users/password/forgot', to: 'users#forgot_password'
      post 'users/password/reset', to: 'users#reset_password'
      resources :users, only: %i[show create update] do
        get 'current', on: :collection
      end
    end
  end
end
