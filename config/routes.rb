Rails.application.routes.draw do
  devise_for :users
  resources :users , only:[:edit, :update]
  root to: "channels#index"
  resources :channels, only: [:new, :create, :destroy] do
    resources :works, only:[:index, :new, :create]
  end
end
