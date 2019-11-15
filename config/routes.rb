Rails.application.routes.draw do
  resources :friends
  resources :friend_requests
  resources :posts do
  resources :comments
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  root to: 'posts#index'

  resources :posts do
    resources :likes
  end
end