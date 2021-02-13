Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/profile', to: 'pages#profile'
  get '/success', to: 'pages#success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'pages/profile', to: 'pages#profile'
end
