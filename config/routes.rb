Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "groups#index"
  resources :groups, only: [:new, :create, :show] do
    resources :entities, only: [:new, :create]
  end
end
