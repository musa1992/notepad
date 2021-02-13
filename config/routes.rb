Rails.application.routes.draw do
  get '/signup', to: 'relationship_officers#new'
  resources :relationship_officers
  
end
