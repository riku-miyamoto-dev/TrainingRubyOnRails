Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  root "users#index"
  resources :users, only: [:index, :new, :create, :show], concerns: :paginatable
  resources :departments, only: [:index, :show] do
    resources :users, only: [:index, :show], concerns: :paginatable do
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
    resources :users, concerns: :paginatable
    resources :skills
    resources :departments do
      resources :users, concerns: :paginatable do
        member do
          get "image"
        end
      end
    end
    # get "users/:id/image", to: "users#show_image", as: "user_image"
  end
end
