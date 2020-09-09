Rails.application.routes.draw do

  root 'nodes#index'

  resources :nodes
  devise_for :creatrixes
  resources :creatrixes, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

