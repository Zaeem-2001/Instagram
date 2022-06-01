Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    # root to: 'devise/registrations#new'
    
    root to: 'home#index'
  end
end
