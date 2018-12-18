Rails.application.routes.draw do
  get '/'          => 'dashboard#index', as: 'root'
  get '*path'      => 'pages#page_404'
end
