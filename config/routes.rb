Rails.application.routes.draw do
  root "users#index"
  resources :departments, only: [:index, :show]
  resources :skills, only: [:index, :show]
  resources :users, only: [:index, :show]

  namespace :admin do
    root "users#index"
    resources :departments
    resources :skills
    resources :users
  end

end
