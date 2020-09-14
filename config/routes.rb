Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :creatrixes

  devise_scope :creatrix do
    authenticated :creatrix do
      root 'nodes#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :nodes do
    resources :donated_sums, only: [:create, :new]
    resources :microservices, only: [:index] do
      resources :microservice_requests, only: [:create]
    end
  end

  resources :microservice_requests, only: [:update]

  resources :creatrixes, only: [:show] 
  
  resources :microservice_category, only:[] do
    resources :microservices, only: [:create]
  end

end



