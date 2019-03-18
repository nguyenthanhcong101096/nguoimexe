# frozen_string_literal: true

Rails.application.routes.draw do
  draw :api
  draw :admin

  devise_for :users, skip: %i[password], controllers: {
    omniauth_callbacks: 'callbacks',
    sessions: 'user_session'
  }

  resources :groups,    only: %i[index show],            param: :name
  resources :comments,  only: %i[index create],          defaults: { format: :html }
  resources :follows,   only: %i[create destroy],        param: :user_id
  resources :messages,  only: %i[index new show create], param: :name
  resources :blogs,     only: %i[index new show create], param: :slug
  resources :posts,     only: %i[new create show],       param: :slug do
    get '/search'  => 'posts#search', on: :collection, as: :search
    get '/preview' => 'posts#preview', on: :collection
  end

  resources :users, only: %i[show], param: :email do
    get '/profile' => 'users#profile', on: :collection
  end

  resources :reset_passwords, only: %i[edit update], param: :token do
    collection do
      get 'forget_password' => 'reset_passwords#forget_password'
      patch 'send_email'    => 'reset_passwords#send_mail'
    end
  end

  # get '/sales'     => 'dashboard#index', defaults: { format: :html }
  get '/' => 'dashboard#index', as: 'root'
  get '*path' => 'pages#page_404'

  mount ActionCable.server => '/cable'
end
