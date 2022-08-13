Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[index new create destroy]
      resources :likes, only: %i[new create]
  end
end
  # Defines the root path route ("/")
  # root "articles#index"
end
