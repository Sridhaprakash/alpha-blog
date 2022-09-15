Rails.application.routes.draw do
  root 'pages#home'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users
  resources :categories
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout' => :destroy, to: 'sessions#destroy'
 
end
