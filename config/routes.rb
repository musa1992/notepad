Rails.application.routes.draw do
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'relationship_officers#new'
  post '/signup', to: 'relationship_officers#create'
  resources :relationship_officers
  
end
