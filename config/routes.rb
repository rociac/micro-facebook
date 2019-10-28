Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  devise_for :users
  get 'users', to: 'users#index'

  root to: 'posts#index'
end