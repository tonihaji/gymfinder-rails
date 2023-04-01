Rails.application.routes.draw do
  get 'sessions/create'
  get 'auth/create'
  resources :users
  resources :gyms

  resources :users, only: [:show]
   resources :gyms
   resources :admins, only: [:create, :show]
  # get "/", to: "admins#index"
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.htm
  # # Defines the root path route ("/")
  # # root "articles#index"
  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'

# Users

# get '/users/:id', to: 'users#show'

# Gyms

# get '/gyms', to: 'gyms#index'
# get '/gyms/new', to: 'gyms#new'
# post '/gyms', to: 'gyms#create'
# get '/gyms/:id', to: 'gyms#show'
# get '/gyms/:id/edit', to: 'gyms#edit'
# patch '/gyms/:id', to: 'gyms#update'
# delete '/gyms/:id', to: 'gyms#destroy'

# Admins

# post '/admins', to: 'admins#create'
# get '/admins/:id', to: 'admins#show'
#  get "/", to: "admins#index"
end
