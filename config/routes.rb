Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: 'guards#index'
  get 'guards/search'
  resources :guards do
    resources :messages, only: [:create]
  end
end
