# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users

  resources :users, only: %i[index show]
  resources :stories , only: %i[index new create show destroy ]
  resources :posts do
    resources :comments , only: %i[create update destroy]
    resources :likes , only: %i[create destroy]
  end
  devise_scope :user do
    root to: 'home#index'
  end
end
