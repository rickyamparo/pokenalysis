Rails.application.routes.draw do
  root :to => 'welcome#index'

  get '/login', to: 'users#login'

  resources :users, only: [:new, :create]
end
