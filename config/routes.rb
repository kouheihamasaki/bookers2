Rails.application.routes.draw do
  resources :users, only: [:show, :edit]
  resources :books, only: [:new, :index, :show, :create]
  devise_for :users
  get 'homes/top'
  root to: "homes#top"
end
