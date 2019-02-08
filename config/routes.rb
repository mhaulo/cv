Rails.application.routes.draw do
	devise_for :users
	
	resources :portfolios do
		resources :samples
	end
	
	resources :resumes do
		resources :experiences
		resources :skills
		resources :sections
	end
	
	root to: "pages#home"
end
