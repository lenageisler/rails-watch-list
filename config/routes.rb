Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # get "lists", to: "lists#index", as: :lists
  # get "lists/new", to: "lists#new"
  # post "lists", to: "lists#create"
  # get "lists/:id", to: "lists#show", as: :list
  # get "lists/:list_id/bookmarks/new", to: "bookmarks#new", as: :new_bookmark
  # post "lists/:list_id/bookmarks", to: "bookmarks#create", as: :create_bookmark

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end

end
