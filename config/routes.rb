Rails.application.routes.draw do
  root "homes#index"
  resources :homes, only: [:index]

  devise_for :users, except: [:index]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/edit' => 'devise/registrations#edit'
  end
  resources :users, only: [:show]

  resources :dishes do
    resources :reviews, except: [:index]
  end

  resources :reviews, except: [:index] do
    resources :votes, only: [:create], defaults: { format: 'json' }
  end

  namespace :admin do
    resources :dishes, only: [:index, :show, :destroy] do
      resources :reviews, only: [:destroy]
    end
    resources :users, only: [:index, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :dishes, only: [:index]
    end
  end
end
