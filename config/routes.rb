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

  resources :upvotes, only: [:create, :destroy]
  resources :knowledge, controller: 'articles', as: 'articles'
  resources :network, controller: 'contacts', as: 'contacts'

  get 'unboarding', to: 'pages#unboarding'

  post 'reporting', to: 'emails#send_reporting'
  post 'ask_intro', to: 'emails#ask_intro'

end
