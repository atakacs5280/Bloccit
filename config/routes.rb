Rails.application.routes.draw do
  get 'labels/show'
  resources :labels, only: [:show]

  resources :topics do
  resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :posts, only: [] do
  resources :comments, only: [:create, :destroy]

  post '/up-vote' => 'votes#up_vote', as: :up_vote
  post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get 'about' => 'welcome#about'

  post 'users/confirm'  => "users#confirm"

  root 'welcome#index'

end
