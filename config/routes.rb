Rails.application.routes.draw do
  devise_for :users, controllers: {
                        omniauth_callbacks: 'omniauth_callbacks' }
  root 'pages#intro'

  resources :users
  resources :challenges, except: :edit

  post 'challenges/:id/join' => 'challenges#join',
       as: :join_challenge

  post 'challenges/:id/quit' => 'challenges#quit',
       as: :quit_challenge

end
