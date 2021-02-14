Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  get '/signup', to: 'relationship_officers#new'
  post '/signup', to: 'relationship_officers#create'
  resources :relationship_officers
  
end
