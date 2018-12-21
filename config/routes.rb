Rails.application.routes.draw do
  devise_for :users, skip: %i[sessions passwords], :controllers => { :omniauth_callbacks => "callbacks" }
  
  post 'signin'   => 'user_session#create'
  delete 'signout' => 'user_session#destroy'
  
  get '/'          => 'dashboard#index', as: 'root'
  get '*path'      => 'pages#page_404'
end
