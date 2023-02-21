Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :index, :new, :update]
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy, :update]
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'home/about' => 'homes#about', as: 'about'
  root to: "homes#top"
end
