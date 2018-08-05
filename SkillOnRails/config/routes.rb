Rails.application.routes.draw do
  get 'sessions/new'
  
  get '/overview', to: 'overview#index'
  
  get '/favorites', to: 'people#favorites'
  
  get    '/signup',  to: 'users#new'
  post	 '/signup',	 to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'
  get '/logout',  to: 'sessions#destroy'
  
  post '/add_to_favorites/:person_id' => 'people#add_to_favorites', :as => 'add_to_favorites'
  post '/remove_from_favorites/:person_id' => 'people#remove_from_favorites', :as => 'remove_from_favorites'
  
  
  resources :people
  resources :users
  resources :courses
  resources :thesis
  resources :projects
  
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
