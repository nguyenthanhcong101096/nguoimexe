Rails.application.routes.draw do
  devise_for :users, skip: %i[sessions passwords], :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :posts, only: %i[show]
  resources :comments, only: %i[index], defaults: { format: :html }
  
  post 'signin'    => 'user_session#create'
  get 'signout'    => 'user_session#destroy'
   
  post 'verify'    => 'users#register_by_phone'
  post 'reset_pwd' => 'users#reset_password'
  get 'profile'    => 'users#show'
  
  get '/'          => 'dashboard#index', as: 'root'
  get '*path'      => 'pages#page_404'
end
