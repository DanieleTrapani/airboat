Rails.application.routes.draw do
  devise_for :users
  root 'boats#index'
  #   comment
end
