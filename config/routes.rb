Rails.application.routes.draw do
  devise_for :users
  root to: 'guards#index'
  get 'guards/search'
  get 'messages/new'
  resources :guards do
    resources :messages, only: [:create]
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
