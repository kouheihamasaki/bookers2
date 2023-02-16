Rails.application.routes.draw do
  resources :books, only: [:new, :index, :show, :create]
  devise_for :users
  get 'homes/top'
  root to: "homes#top"
end
