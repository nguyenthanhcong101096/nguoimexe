# frozen_string_literal: true

Rails.application.routes.draw do
  get 'notifications/index'

  devise_for :users, skip: %i[sessions passwords], controllers: { omniauth_callbacks: 'callbacks' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :posts, only: %i[new create show]
  resources :comments, only: %i[index create], defaults: { format: :html }
  resources :follows, only: %i[create destroy], param: :user_id
  resources :messages, only: %i[index show create]
  resources :blogs, only: %i[new show create]

  resources :users, only: %i[show edit update] do
    get 'change_password'   => 'users#change_password', on: :member
    patch 'set_password'    => 'users#set_password', on: :member
  end

  post 'signin'    => 'user_session#create'
  get 'signout'    => 'user_session#destroy'

  post 'verify'    => 'users#register_by_phone'
  post 'reset_pwd' => 'users#reset_password'

  get 'markup'     => 'dashboard#markup'

  get '/'          => 'dashboard#index', as: 'root'
  get '*path'      => 'pages#page_404'

  mount ActionCable.server => '/cable'
end
