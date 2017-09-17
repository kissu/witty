Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'articles#index'
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :articles
  resources :upvotes, only: [:create, :destroy]

  get 'network', to: 'users#index'
  get 'contact', to: 'contacts#index'
end
