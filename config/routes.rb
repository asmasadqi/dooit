Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :activities do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[new create]
  end

  resources :reviews, only: [:delete]

  resources :users do
    resources :activities, only: [:index]
    resources :bookings, only: [:index]
  end

  resources :bookings, only: %i[edit update]

  # Defines the root path route ("/")
  # root "articles#index"
end
