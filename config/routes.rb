
Rails.application.routes.draw do
  root 'relationship_officers#new'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'relationship_officers#new'
  post '/signup', to: 'relationship_officers#create'
  get '/profile', to: 'relationship_officers#show'
  get '/addclient', to: 'clients#new'
  post '/addclient', to: 'clients#create'
  get '/viewclient', to: 'clients#show'
  get '/clientinformation', to: 'clients#client_information'
  get '/loaninformation', to: 'clients#loan_information'
  resources :relationship_officers
  resources :clients, only: [:new,:create, :edit, :destroy] 
  
end
