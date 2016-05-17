Rails.application.routes.draw do
  get 'auth/:provider/callback',  to: 'sessions#create'
  get 'auth/failure',             to: redirect('/')
  get 'logout',                   to: 'sessions#destroy', as: 'logout'

  resources :videos
  resources :dummies
  resources :users
  resources :subscriptions, only: [:create]

  delete '/subscriptions', to: 'subscriptions#destroy', as: 'unsubscription'

  namespace :admin do
    resources :travels
  end

  root 'home#index'
  get 'infomap' => 'videos#infomap'
  get 'infomap2' => 'videos#infomap2'
  get 'infomap3' => 'videos#infomap3'
  get 'infomap4' => 'videos#infomap4'
  get 'infomap5' => 'videos#infomap5'
end
