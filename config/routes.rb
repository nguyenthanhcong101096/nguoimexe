# frozen_string_literal: true

Rails.application.routes.draw do
  draw :api
  draw :admin

  devise_for :users, skip: %i[password session registrations], controllers: {
    omniauth_callbacks: 'callbacks'
  }

  resources :users,     only: %i[show], param: :slug
  resources :stores,    only: %i[new index create show], param: :name
  resources :groups,    only: %i[new index show create], param: :name
  resources :comments,  only: %i[index create],          defaults: { format: :html }
  resources :follows,   only: %i[create destroy],        param: :user_id
  resources :messages,  only: %i[index new show create], param: :name
  resources :blogs,     only: %i[index new show create], param: :slug
  resources :posts,     only: %i[new create show],       param: :slug do
    get '/search'  => 'posts#search', on: :collection, as: :search
    get '/preview' => 'posts#preview', on: :collection
  end

  resources :auth, only: %i[create] do
    post '/signup'  => 'auth#signup',  on: :collection
    get  '/log_out' => 'auth#log_out', on: :collection
  end

  resources :reset_passwords, only: %i[edit update], param: :token do
    collection do
      get 'forget_password' => 'reset_passwords#forget_password'
      patch 'send_email'    => 'reset_passwords#send_mail'
    end
  end

  get '/notifications' => 'pages#notifications'
  get '/community'     => 'dashboard#community'
  get '/'              => 'dashboard#index', defaults: { format: :html }, as: 'root'
  get '*path'          => 'pages#page_404'

  mount ActionCable.server => '/cable'
end
