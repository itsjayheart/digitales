Rails.application.routes.draw do
  get 'digitales_dot_gg/static_index'
  root 'digitales_dot_gg/static_index'
  get 'creatrixes/show'
  root 'test#test_assets_pipeline'

  devise_for :creatrixes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

