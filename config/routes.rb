Rails.application.routes.draw do
  devise_for :users, controllers: {
                        omniauth_callbacks: 'omniauth_callbacks' }

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  get '/feed', to: 'feed#index'

  resources :challenges, except: :edit

  post 'challenges/:id/join' => 'challenges#join',
       as: :join_challenge

  post 'challenges/:id/quit' => 'challenges#quit',
       as: :quit_challenge

end
