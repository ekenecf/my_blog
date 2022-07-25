Rails.application.routes.draw do
  get 'comments/index'
  get 'likes/index'
  get 'posts/index'
  root to: 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new ] do
      resources :likes, only: %i[new ]
    resources :comments, only: %i[new ]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
