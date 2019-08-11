Rails.application.routes.draw do
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
end
