Rails.application.routes.draw do
  root "homes#index"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/edit' => 'devise/registrations#edit'
  end
  resources :users

  resources :dishes do
    resources :reviews, only: [:new, :create] do
      resources :votes, only: [:new, :create, :edit, :update, :destroy]
    end
  end


  namespace :api do
    namespace :v1 do
      resources :dishes do
        resources :users
        resources :reviews
      end
    end
  end
end
