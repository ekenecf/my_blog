Rails.application.routes.draw do
  get 'posts/index'
  root to: 'users#index'

  resources :users, only: %i[index new show] do
    resources :posts, only: %i[index new show]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
