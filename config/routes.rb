Rails.application.routes.draw do
  # get 'maps/index'
  # get 'chart/index'
  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    }
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create,:new] do
    resources :comments, only: :create
    collection do
      get :search
      get :top
      get :top2
    end
    resources :likes, only: [:create, :destroy]
  end
  get 'post/index_rank', to: 'posts#index_rank'
  # root 'posts#index'



  root to: 'posts#top'
  resources :maps, only: [:index]

  get '/map_request', to: 'maps#map', as: 'map_request'
end
