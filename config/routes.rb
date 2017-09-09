Rails.application.routes.draw do
  root :to => 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/battle', to: 'pokemons#battle'
  # Switch battle action from pokemons controller to battles controller
  post '/battle', to: 'battles#create'
  get '/database', to: 'database#index'
  post '/database', to: 'database#create'
  
  resources :users, only: [:new, :create]
end
