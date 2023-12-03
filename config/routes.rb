Rails.application.routes.draw do
  get 'lives/index'
  get 'lives/new'
  get 'lives/edit'
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: 'homes#top'
end
