Rails.application.routes.draw do
  
  	resources :posts, only: [:new, :create, :edit, :update, :destroy] 

	root "home#index"

	get '/login', to: 'sessions#new', as: "log"
	post '/login', to: 'sessions#create', as: "login"
	delete '/logout', to: 'sessions#destroy'

	resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
		member do
			get "confirm"
		end
	end

	resources :paniers, only: [:new, :create, :edit, :show, :update, :destroy]
	resources :charges, only: [:create]
	get '/achat/:montant', to: "charges#new", as: "achat"
	resources :commands, only: [:destroy]

end
