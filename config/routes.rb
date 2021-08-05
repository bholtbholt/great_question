Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :incentives, only: %i[index create update]
    resource :redemption, only: %i[create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :redeem, to: 'candidates#show'
  get :setup, to: 'researchers#show'
  root to: 'home#index'
end
