# frozen_string_literal: true

Rails.application.routes.draw do
  constraints(SubdomainSale) do
    resources :posts, only: %i[new create show], param: :slug
    get '/' => 'dashboard#index'
  end

  constraints(SubdomainAdmin) do
    get '/' => 'admin#index'
  end
  
  constraints(SubdomainStore) do
    get '/' => 'stores#index'
  end

  devise_for :users, skip: %i[sessions passwords], controllers: { omniauth_callbacks: 'callbacks' }

  resources :groups, only: %i[index show]
  resources :comments, only: %i[index create], defaults: { format: :html }
  resources :follows, only: %i[create destroy], param: :user_id
  resources :messages, only: %i[index new show create]
  resources :blogs, only: %i[index new show create], param: :slug

  resources :users, only: %i[show edit update] do
    get 'profile'           => 'users#profile', on: :collection
  end
  
  post 'signin'    => 'user_session#create'
  get 'signout'    => 'user_session#destroy'

  get '/'          => 'pages#index', as: 'root'
  get '*path'      => 'pages#page_404'

  mount ActionCable.server => '/cable'
end
