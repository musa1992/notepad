Rails.application.routes.draw do
  get '/signup', to: 'relationship_officers#new'
  post '/signup', to: 'relationship_officers#create'
  resources :relationship_officers
  
end
