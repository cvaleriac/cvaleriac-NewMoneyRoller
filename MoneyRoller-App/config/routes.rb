Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/signin' => 'users#signin', as: :signin
  post '/login' => 'users#login', as: :login
  get '/logout' => 'users#logout', as: :logout
  get '/rollovers' => 'rollovers#index', as: :index
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :institutions, only: [:show]
  resources :rollovers, only: [:show, :new]
end
