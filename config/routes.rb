Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to: 'page#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users
  resources :categories, except: [:destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout' => :destroy, to: 'sessions#destroy'
 
end
