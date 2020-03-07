Rails.application.routes.draw do
  # get 'ping/index'
  # get 'posts/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :ping, only: [:index]
    resources :posts, only: [:index]
  end
end
