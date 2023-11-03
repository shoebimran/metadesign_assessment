Rails.application.routes.draw do
	devise_for :users	
	root 'uploads#new'
	resources :uploads, only: [:new, :create, :index]
	get 'view_users', to: 'uploads#index', as: :view_users

end
	