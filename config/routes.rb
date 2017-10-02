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
      get 'featured', to: "articles#featured"
    end
  end
  resources :network, controller: 'contacts', as: 'contacts' do
    member do
      get 'ask_intro', to: 'pages#ask_intro'
      post 'ask_intro', to: 'emails#ask_intro'
    end
  end

  get 'onboarding', to: 'pages#onboarding'

  get 'reporting', to: 'pages#send_report'
  post 'reporting', to: 'emails#send_reporting'
end
