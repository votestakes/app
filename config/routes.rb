Rails.application.routes.draw do
  devise_for :users, controllers: {
                        omniauth_callbacks: 'omniauth_callbacks' }
  root 'challenges#index'

  resources :users
  resources :challenges

  post 'challenges/:id/join' => 'challenges#join',
       as: :join_challenge

end
