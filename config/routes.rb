# frozen_string_literal: true

Rails.application.routes.draw do
  constraints(SubdomainAdmin) do
    get '/' => 'admin#index'
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'callbacks',
    sessions: 'user_session'
  }

  resources :posts,    only: %i[new create show],       param: :slug
  resources :groups,   only: %i[index show],            param: :name
  resources :comments, only: %i[index create],          defaults: { format: :html }
  resources :follows,  only: %i[create destroy],        param: :user_id
  resources :messages, only: %i[index new show create]
  resources :blogs,    only: %i[index new show create], param: :slug

  get '/sales'     => 'dashboard#index'
  get '/'          => 'pages#index', as: 'root'
  get '*path'      => 'pages#page_404'

  mount ActionCable.server => '/cable'
end
