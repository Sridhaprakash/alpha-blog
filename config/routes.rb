Rails.application.routes.draw do
  root 'pages#home'
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  resources :users
  # Defines the root path route ("/")
  #root "articles#index"
 
end
