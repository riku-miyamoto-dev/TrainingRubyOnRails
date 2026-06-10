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
  resources :users, only: [:index, :new, :create]
  # get "users/:id/image", to: "users#show_image", as: "user_image"

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
    # get "users/:id/image", to: "users#show_image", as: "user_image"
  end
end
