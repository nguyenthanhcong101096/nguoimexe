# frozen_string_literal: true

Rails.application.routes.draw do
  constraints(SubdomainSale) do
    get '/' => 'groups#index'
  end
  
  constraints(SubdomainAdmin) do
    get '/' => 'admin#index'
  end
  
  devise_for :users, skip: %i[sessions passwords], controllers: { omniauth_callbacks: 'callbacks' }

  resources :posts, only: %i[new create show], param: :slug
  resources :comments, only: %i[index create], defaults: { format: :html }
  resources :follows, only: %i[create destroy], param: :user_id
  resources :messages, only: %i[index new show create]
  resources :blogs, only: %i[index new show create], param: :slug

  resources :users, only: %i[show edit update] do
    get 'change_password'   => 'users#change_password', on: :member
    patch 'set_password'    => 'users#set_password', on: :member
  end
  
  post 'signin'    => 'user_session#create'
  get 'signout'    => 'user_session#destroy'

  get 'markup'     => 'dashboard#markup'

  get '/'          => 'dashboard#index', as: 'root'
  get '*path'      => 'pages#page_404'

  mount ActionCable.server => '/cable'
end
