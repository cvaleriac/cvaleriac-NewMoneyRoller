Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/signin' => 'users#signin', as: :signin
  post '/login' => 'users#login', as: :login
  get '/logout' => 'users#logout', as: :logout
  get '/rollovers/index' => 'rollovers#index', as: :index
  get '/rollovers/incoming' => 'rollovers#show', as: :show
  get '/rollovers/outgoing' => 'rollovers#outgoing', as: :outgoing
  
  
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :institutions, only: [:index, :show, :new]
  resources :rollovers, only: [:new, :create, :edit, :destroy]
end
