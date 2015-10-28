Rails.application.routes.draw do
  root 'challenges#index'

  resources :challenges

end
