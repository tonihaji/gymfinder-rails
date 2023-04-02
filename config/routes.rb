Rails.application.routes.draw do
  # get 'sessions/create'
  # get 'auth/create'
  # resources :users
  # resources :gyms

  resources :users, only: [:show]
  resources :gyms
  resources :admins, only: [:create]
  get '/current_admin', to: 'application#current_admin'
  get '/profile', to: 'admins#profile'
  post '/login', to: 'auth#create'
end
