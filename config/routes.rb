Rails.application.routes.draw do
  resources :users
  root 'challenges#index'

  resources :challenges

end
