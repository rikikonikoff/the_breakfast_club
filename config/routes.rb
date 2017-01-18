Rails.application.routes.draw do
  devise_for :users
  root "dishes#index"

  resources :dishes
end
