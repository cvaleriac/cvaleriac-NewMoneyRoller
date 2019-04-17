Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/signin' => 'users#signin', as: :signin
  post '/login' => 'users#login', as: :login
  get '/logout' => 'users#logout', as: :logout
  get '/rollovers/index' => 'rollovers#index', as: :index
  get '/rollovers/incoming/:id' => 'rollovers#incoming', as: :incoming
  get '/rollovers/outgoing/:id' => 'rollovers#outgoing', as: :outgoing
  get '/rollovers/incoming/:id/edit' => 'rollovers#edit', as: :editincoming
  get '/rollovers/outgoing/:id/edit' => 'rollovers#edit', as: :editoutgoing

resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :institutions, only: [:index, :show, :new]
  resources :rollovers, only: [:new, :create, :edit, :destroy]

  resources :institutions, only: [:show] do
    # nested resource for rollovers
    resources :rollovers, only: [:incoming, :outgoing, :index]
  end
 
  resources :rollovers, only: [:index, :incoming, :outgoing, :new, :create, :edit, :update]
 
  root 'rollovers#index'
end