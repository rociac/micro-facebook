Rails.application.routes.draw do
  resources :friends
  resources :friend_requests
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'

  resources :posts do
    resources :likes
    resources :comments
  end
  
 devise_scope :user do
  authenticated :user do
    root 'posts#index', as: :root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end

end