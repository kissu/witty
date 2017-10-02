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
  resources :knowledge, controller: 'articles', as: 'articles' do
    member do
      get 'share', to: 'articles#share'
      get 'featured', to: "articles#featured"
    end
  end
  resources :network, controller: 'contacts', as: 'contacts'

  get 'onboarding', to: 'pages#onboarding'
  post 'reporting', to: 'emails#send_reporting'
  post 'ask_intro', to: 'emails#ask_intro'

end
