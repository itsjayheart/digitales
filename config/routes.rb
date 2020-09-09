Rails.application.routes.draw do

  devise_scope :creatrix do
    authenticated :creatrix do
      root 'nodes#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :nodes
  devise_for :creatrixes
  resources :creatrixes, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :creatrixes, only: [:show]
end



