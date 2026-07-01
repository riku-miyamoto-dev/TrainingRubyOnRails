# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i[index new create show] do
    member do
      get 'image'
    end
  end

  get '/sitemaps', to: 'sitemaps#show', defaults: { format: 'xml' }

  # get '/404', to: 'errors#not_found', as: :not_found


  resources :departments, only: %i[index show] do
    resources :users, only: %i[index show] do
      member do
        get 'image'
      end
    end
  end
  resources :skills, only: %i[index show]
  resource :sessions, only: %i[new create destroy]
  get '/auth/github/callback', to: 'github_auth#github_create'
  resources :users, only: %i[index new create]

  namespace :admin do
    root 'users#index'
    resources :users do
      member do
        get 'image'
      end
    end
    resources :skills
    resources :departments do
      resources :users do
        member do
          get 'image'
        end
      end
    end
  end
end
