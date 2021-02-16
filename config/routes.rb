Rails.application.routes.draw do
  devise_for :users
  root to: 'guards#index'
  resources :guards
end
