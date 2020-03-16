Rails.application.routes.draw do
  get 'chart/index'
  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create,:new] do
    resources :likes, only: [:create, :destroy]
  end
  get 'post/index_rank', to: 'posts#index_rank'

  root 'posts#index'
end
