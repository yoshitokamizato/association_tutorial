Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'comments/create'
  get 'comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users

  root to: "tweets#index"

  resources :tweets  # 追加
  resources :users  # 追加

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end

  resources :tweets do
    resource :comments, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
end
