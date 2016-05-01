Rails.application.routes.draw do
  # Resources sets up gets for all of posts paths
  resources :posts
  # Sets home/root or '/' path to '/posts'
  root "posts#index"
end
