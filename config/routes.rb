Rails.application.routes.draw do
  # get 'maps/index'
  # get 'chart/index'
  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # resources :users, only: [:index, :show]
  post '/guest', to: 'guest#create'
  post '/guest2', to: 'guest#create2'
  resources :posts, only: [:index, :show, :create,:new,:destroy] do
    resources :comments, only: :create
    collection do
      get :search
      get :top
      get :practicejs
    end
    member do
      get :search_category
    end

    resources :likes, only: [:create, :destroy]
  end
  get 'post/index_rank', to: 'posts#index_rank'
  root to: 'posts#top'
  resources :maps, only: [:index]
  get '/map_request', to: 'maps#map', as: 'map_request'
end
