Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'challenges#index'

  resources :challenges

end
