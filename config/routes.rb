Rails.application.routes.draw do
  root "dishes#index"

  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: [:show]

  resources :dishes do
    resources :reviews, only: [:new, :create]
  end
end
