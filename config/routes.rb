Rails.application.routes.draw do
  devise_for :users
  root 'boats#index'

  #   resources :boats
  resources :bookings, only: %i[destroy edit update]

  resources :boats, except: %i[index] do
    resources :bookings, only: %i[new create]
  end
end
