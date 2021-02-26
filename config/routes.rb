Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#home'

  get '/profile', to: 'pages#profile'
  get '/success', to: 'pages#success'


  # Master 2

  get '/confirmation', to: 'pages#confirmation'

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
