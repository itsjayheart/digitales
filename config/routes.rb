Rails.application.routes.draw do
  get 'creatrixes/show'
  devise_for :creatrixes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
