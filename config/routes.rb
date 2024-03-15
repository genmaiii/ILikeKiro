Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :lives, only: [:index, :new, :create, :edit, :update, :destroy]
end
