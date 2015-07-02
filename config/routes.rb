Rails.application.routes.draw do
  resources :lists do
    resources :items do
    	member do
    		patch :complete
        patch :put
    	end
    end
  end
  root "lists#index"
end
