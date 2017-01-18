Rails.application.routes.draw do
  devise_for :users
  root "dishes#index"

  resources :dishes do
    resources :reviews, only: [:new, :create]
  end
end
