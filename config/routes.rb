Rails.application.routes.draw do
  root :to => 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/battle', to: 'pokemons#battle'

  resources :users, only: [:new, :create]
end
