Rails.application.routes.draw do
  devise_for :users , controllers: {registrations: 'registrations'}

  root 'pages#home'

  resources :users , only: [:show ,:index]
  resources :friendships , only: [:create ,:destroy] do
  	member do
  		put :accept
  	end
  end

  resources :posts , only:[:create ,:destroy , :edit ,:update]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
