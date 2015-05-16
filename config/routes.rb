Rails.application.routes.draw do
  root 'training_plans#index'
  devise_for :users

  resources :users do
    resources :training_plans, only: [:index, :new, :create, :update]
  end
end
