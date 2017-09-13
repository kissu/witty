Rails.application.routes.draw do


  ActiveAdmin.routes(self)
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'articles#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :articles
  resources :upvotes, only: [:create, :destroy]
end
