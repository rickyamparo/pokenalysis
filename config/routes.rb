Rails.application.routes.draw do
  root :to => 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/battle', to: 'pokemons#battle'
  post '/battle', to: 'battles#create'
  # Switch battle action from pokemons controller to battles controller

  get '/database', to: 'database#index'
  post '/database', to: 'database#create'

  get '/battle_analysis', to: 'analysis#index'

  resources :users, only: [:new, :create]
end
