Rails.application.routes.draw do
  devise_for :users
  # Resources sets up gets for all of posts paths nests comments on posts
  resources :posts do
    resources :comments
  end
  # Sets home/root or '/' path to '/posts'
  root "posts#index"

  get '/about', to: 'pages#about'
end
