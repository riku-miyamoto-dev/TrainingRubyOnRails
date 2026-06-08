Rails.application.routes.draw do
  root "users#index"
  resources :departments, only: [:index, :show]
  resources :skills, only: [:index, :show]
  resources :users, only: [:index, :show]do
      member do
        get "image"
      end
    end
  # get "users/:id/image", to: "users#show_image", as: "user_image"

  namespace :admin do
    root "users#index"
    resources :departments
    resources :skills
    resources :users do
      member do
        get "image"
      end
    end
    # get "users/:id/image", to: "users#show_image", as: "user_image"
  end

end
