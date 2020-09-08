Rails.application.routes.draw do
  root 'test#test_assets_pipeline'

  devise_for :creatrixes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

