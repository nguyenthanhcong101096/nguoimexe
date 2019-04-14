# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :messages,      only: %i[index create]
      resources :provinces,     only: %i[show]
      resources :brands,        only: %i[show]
      resources :vehicle_kinds, only: %i[show]
    end
  end
end
