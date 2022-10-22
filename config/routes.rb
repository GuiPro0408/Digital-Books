Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books do
    resources :rents, only: [:new, :create, :show]
    resources :reviews, only: [:new, :create]
    member do
      get :content
    end
  end
  resources :rents, only: [:index, :destroy]
  resources :reviews, only: [:destroy]
  # Defines the root path route ("/")
end
