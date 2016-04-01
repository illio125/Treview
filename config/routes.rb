Rails.application.routes.draw do
  get 'auth/:provider/callback',  to: 'sessions#create'
  get 'auth/failure',             to: redirect('/')
  get 'logout',                   to: 'sessions#destroy', as: 'logout'

  resources :videos
  resources :dummies

  root 'home#index'
end
