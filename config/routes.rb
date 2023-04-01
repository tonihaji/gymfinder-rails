Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :gyms
  resources :admins, only: [:create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
