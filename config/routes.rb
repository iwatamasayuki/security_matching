Rails.application.routes.draw do
  devise_for :users
  root to: 'guards#index'
  get 'guards/search'
  get 'messages/new'
  post 'guards/new'
  
  resources :guards do
    resources :messages, only: [:create]
  end
end
