Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :index]
  resources :books, only: [:new, :index, :show, :create]
  devise_for :users
  get 'homes/about'
  root to: "homes#top"
end
