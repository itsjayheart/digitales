Rails.application.routes.draw do

  devise_scope :creatrix do
    root to: "devise/sessions#new"
  end

  resources :nodes
  devise_for :creatrixes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :creatrixes, only: [:show]
end

