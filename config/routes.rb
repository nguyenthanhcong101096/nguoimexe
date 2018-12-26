Rails.application.routes.draw do
  get 'notifications/index'

  devise_for :users, skip: %i[sessions passwords], :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :posts, only: %i[new create show]
  resources :comments, only: %i[index create], defaults: { format: :html }
  resources :users, only: %i[show]
  
  post 'signin'    => 'user_session#create'
  get 'signout'    => 'user_session#destroy'
   
  post 'verify'    => 'users#register_by_phone'
  post 'reset_pwd' => 'users#reset_password'
  
  get '/'          => 'dashboard#index', as: 'root'
  get '*path'      => 'pages#page_404'
  
  mount ActionCable.server => '/cable'
end
