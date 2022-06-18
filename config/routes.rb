# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :users, only: %i[index show]

  resources :posts do
    resources :comments, only: %i[create update destroy]
  end
  devise_scope :user do
    root to: 'home#index'
  end
end
