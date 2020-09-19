Rails.application.routes.draw do

  devise_for :creatrixes

  devise_scope :creatrix do
    authenticated :creatrix do
      root 'nodes#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'digitales_dot_gg#the_hook', as: :unauthenticated_root
    end
  end

  resources :nodes do
    resources :donated_sums, only: [:create, :new, :update]
    resources :microservices, only: [:index] do
      resources :microservice_requests, only: [:create]
    end
  end
  resources :microservices, only: [:destroy] 

  resources :digitales, only: [:show]

  resources :what_ifs, only: [:create, :update]

  resources :m_statements, only: [:create, :update]

  resources :microservice_requests, only: [:update]

  resources :creatrixes, only: [:show] 
  
  resources :microservice_category do
    resources :microservices, only: [:create]
  end

  resources :creatrixes, only: [:show] do
    resources :avatars, only: [:create]
  end

end



