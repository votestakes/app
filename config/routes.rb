Rails.application.routes.draw do
  devise_for :users, controllers: {
                        omniauth_callbacks: 'omniauth_callbacks' }
  root 'pages#intro'

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :challenges, except: :edit

  post 'challenges/:id/join' => 'challenges#join',
       as: :join_challenge

  post 'challenges/:id/quit' => 'challenges#quit',
       as: :quit_challenge

end
