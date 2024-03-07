Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update]
  resources :posts
  resources :lives, only: [:index, :new, :create, :edit, :update, :destroy]
end
