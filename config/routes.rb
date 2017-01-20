Rails.application.routes.draw do

root "homes#index"

  devise_for :users
  resources :users
  resources :homes, only: [:index]


  resources :dishes do
    resources :reviews, only: [:new, :create]
  end
end
