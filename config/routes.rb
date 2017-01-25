Rails.application.routes.draw do
root "homes#index"
  resources :dishes do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
 end

  resources :reviews, only: [:new, :create, :edit, :update, :destroy] do
   resources :votes, defaults: { format: 'json' }
 end

 devise_for :users, controllers: { registrations: :registrations }
 resources :users
 resources :homes, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :dishes do
        resources :users
        resources :reviews
      end
      resources :reviews do
        resources :votes
      end
    end
  end
end
