Rails.application.routes.draw do
  devise_for :users, skip: %i[sessions passwords], :controllers => { :omniauth_callbacks => "callbacks" }
  
  post 'signin'    => 'user_session#create'
  get 'signout'    => 'user_session#destroy'
   
  post 'verify'    => 'users#verify_sms'
  get 'profile'    => 'users#show'
  
  get '/'          => 'dashboard#index', as: 'root'
  get '*path'      => 'pages#page_404'
end
