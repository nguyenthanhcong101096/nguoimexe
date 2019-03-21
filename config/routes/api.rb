# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :provinces,     only: %i[show]
      resources :brands,        only: %i[show]
      resources :vehicle_kinds, only: %i[show]
      resources :user_sessions, only: %i[create] do
        post '/signup' => 'user_sessions#signup', on: :collection
      end
    end
  end
end
