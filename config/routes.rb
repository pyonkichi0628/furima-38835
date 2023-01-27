Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  #全てのルート含む[:index, :new, :create, :show, :edit, :update, :destroy]
  resources :products do
  #購入機能に必要なルーティング
    resources :items, only: [:index, :create]
  end
end
