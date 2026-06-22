Rails.application.routes.draw do  
  root "users#index"
  resources :users, only: [:index, :new, :create, :show] do
    member do
      get "image"
    end
  end
  
    resources :departments, only: [:index, :show] do
    resources :users, only: [:index, :show] do
      member do
        get "image"
      end
    end
  end
  resources :skills, only: [:index, :show]
  resource :sessions, only: [:new, :create, :destroy]
  get '/auth/github/callback', to: 'github_auth#github_create'
  resources :users, only: [:index, :new, :create]

  namespace :admin do
    root "users#index"
    resources :users do
      member do
          get "image"
      end
    end
    resources :skills
    resources :departments do
      resources :users do
        member do
          get "image"
        end
      end
    end
  end
end
