Rails.application.routes.draw do
root "homes#index"
  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: [:show]
  resources :homes, only: [:index]

  resources :dishes do
    resources :reviews, only: [:new, :create] do
      resources :votes, only: [:new, :create, :edit, :update, :destroy]
    end
  end
end
