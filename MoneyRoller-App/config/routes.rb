Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/facebook/callback' => 'sessions#create'
  post 'signup' => 'users#create'
 get 'signin'=> 'sessions#login'
 post 'signin' => 'sessions#create'
 delete 'logout' => 'sessions#logout'
  
end
