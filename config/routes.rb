Rails.application.routes.draw do
  resources :products
  devise_for :businesses
  get 'admin/index'
  unauthenticated :user do
		devise_scope :user do
			root 'admin#unregistered', as: :unregistered_root
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
