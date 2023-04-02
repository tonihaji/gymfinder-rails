Rails.application.routes.draw do
  # get 'sessions/create'
  # get 'auth/create'
  # resources :users
  # resources :gyms

  # resources :users, only: [:show]
  # resources :gyms
  # resources :admins, only: [:create]
  get '/current_admin', to: 'application#current_admin'
  get '/profile', to: 'admins#profile'
  post '/login', to: 'auth#create'

#gym routes
get "/", to: "gyms#index"
# get '/gyms/:id', to: 'gyms#show', 
# post '/gyms', to: 'gyms#create', 
# delete '/gyms/:id', to: 'gyms#destroy'

# # users
# get "users", to: "users#index"
# get '/users/:id', to: 'users#show', 
# post '/users', to: 'users#create', 
# delete '/users/:id', to: 'users#destroy'

# # admins
# get "admins", to: "admins#index"
# get '/admins/:id', to: 'admins#show', 
# post '/admins', to: 'admins#create', 
# delete '/admins/:id', to: 'admins#destroy'


end
