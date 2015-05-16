Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :homes, only: [:index, :new]
end
