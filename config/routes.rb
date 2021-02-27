Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get '/profile', to: 'pages#profile'
  get '/success', to: 'pages#success'


  # New Sign Up Flow
  get '/complete_profile', to: 'pages#complete_profile'
  get '/roles', to: 'pages#roles'
  get '/confirmation', to: 'pages#confirmation'
  get '/preferences', to: 'pages#preferences', as: 'preferences'

  patch '/roles', to: 'pages#update_roles', as: "update_roles"
  patch '/preferences', to: 'pages#update_preferences', as: "update_preferences"



  get '/tips', to: 'pages#tips'

  post '/match_me', to: 'pages#match_me'

  get '/user' => "pages#profile", :as => :user_root

  devise_scope :user do
    get 'sign_up', to: 'pages#user_type'
  end

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
