Rails.application.routes.draw do
  root :to => 'welcome#index'

  get '/login', to: 'account#login'
  get '/register', to: 'account#register'
end
