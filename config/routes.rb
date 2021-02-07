Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#home'

  get '/profile', to: 'pages#profile'
  get '/success', to: 'pages#success'

  devise_scope :user do
    get 'sign_up', to: 'pages#user_type'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
