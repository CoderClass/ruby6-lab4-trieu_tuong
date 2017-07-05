Rails.application.routes.draw do
  
  resources :rooms do
  	resources :messages
  end
  root 'home#index'

  get 'logout', to: "home#logout"
  post 'login', to: "home#login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
