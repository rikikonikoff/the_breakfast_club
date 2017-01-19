Rails.application.routes.draw do

  resources :votes
root "homes#index"
  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: [:show]
  resources :homes, only: [:index]

  resources :dishes do
    resources :reviews, only: [:new, :create]
  end
end
