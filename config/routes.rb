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

  resources :digitales, only: [:show]

  resources :what_ifs, only: [:create, :update]

  resources :m_statements, only: [:create, :update]

  resources :microservice_requests, only: [:update]

  resources :creatrixes, only: [:show] 
  
  resources :microservice_category do
    resources :microservices, only: [:create]
  end

end



