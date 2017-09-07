Rails.application.routes.draw do
  root :to => 'welcome#index'

  get '/login', to: 'accounts#login'
  get '/register', to: 'accounts#register'
end
