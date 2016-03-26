
Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :comments, only: [:create, :destroy]
  resources :topics do
  resources :posts, except: [:index]
  end

  resources :posts, only: []

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
