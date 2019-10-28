Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  devise_for :users
  root to: 'static_pages#home'

end
