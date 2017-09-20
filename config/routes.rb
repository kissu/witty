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

  resources :network, controller: 'contacts', as: 'contacts'

  get 'unboarding', to: 'pages#unboarding'

  post 'reporting', to: 'emails#send_reporting'
  post 'ask_for_contact', to: 'emails#ask_for_contact'

end
