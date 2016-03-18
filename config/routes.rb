Rails.application.routes.draw do
  resources :dummies

  root 'home#index'

end
