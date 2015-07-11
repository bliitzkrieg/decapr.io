Rails.application.routes.draw do

  devise_for :users

  resources :posts do
  	resources :comments
  end

  root 'pages#index'
  get '/contact', to: 'pages#contact'
  get '/portfolio', to: 'pages#portfolio'
end
