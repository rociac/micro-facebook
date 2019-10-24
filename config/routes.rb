Rails.application.routes.draw do
  get 'posts/create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  resources :posts
end
