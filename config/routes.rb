Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

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

  get '/user' => "pages#confirmation", :as => :user_root

  devise_scope :user do
    get 'sign_up', to: 'pages#user_type'
  end

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
