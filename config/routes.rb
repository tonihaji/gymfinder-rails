Rails.application.routes.draw do
 
  resources :users, only: [:show]
    resources :gyms
   , only: [:index, :create]
  resources :admins, only: [:create]
  get '/current_admin', to: 'application#current_admin'
  get '/profile', to: 'admins#profile'
  post '/login', to: 'auth#create'


#gym routes
  get "/gyms", to: "gyms#index"
 # post "/gyms", to: "gyms#create"
#   get '/gyms/:id', to: 'gyms#show', 
#  delete '/gyms/:id', to: 'gyms#destroy'
#   patch '/gyms/:id' , to: 'gyms#update'

# # users
# get "users", to: "users#index"
# get '/users/:id', to: 'users#show', 
# post '/users', to: 'users#create', 
# delete '/users/:id', to: 'users#destroy'

# # admins
#  get "admins", to: "admins#index"
# get '/admins/:id', to: 'admins#show', 
#  post '/admins', to: 'admins#create', 
# delete '/admins/:id', to: 'admins#destroy'


end
