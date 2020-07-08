Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get '/upload', to: 'images#new'
  resources :images, only: [:index, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
