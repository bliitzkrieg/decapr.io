Rails.application.routes.draw do

  devise_for :users

  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts do
  	resources :comments
  end

  root 'pages#index'
  get '/contact', to: 'pages#contact'
  get '/portfolio', to: 'pages#portfolio'
end
