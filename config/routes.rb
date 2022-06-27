Rails.application.routes.draw do
  root 'pages#home'
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout' => :destroy, to: 'sessions#destroy'
  
  # Defines the root path route ("/")
  #root "articles#index"
 
end
