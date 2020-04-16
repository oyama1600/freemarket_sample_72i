Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get 'users/show'
  get 'users/logout'
  devise_for :users
  root to: 'tops#index'
  resources :users
  resources :tops do
    resources :comments, only: :create
  end
  
  resources :purchases

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
