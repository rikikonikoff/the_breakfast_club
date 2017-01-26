Rails.application.routes.draw do
root "homes#index"
  resources :dishes do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
 end

  resources :reviews, only: [:new, :create, :edit, :update, :destroy] do
   resources :votes, defaults: { format: 'json' }
 end

 devise_for :users
 devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
   post '/users/edit' => 'devise/registrations#edit'
 end
 resources :users
 resources :homes, only: [:index]

  namespace :admin do
    resources :dishes do
      resources :reviews
    end
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :dishes, only: [:index]
    end
  end
end
