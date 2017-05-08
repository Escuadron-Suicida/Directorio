Rails.application.routes.draw do
  root 'businesses#index'

  resources :businesses do
    resources :products
  end

  scope :session do
    devise_for :businesses
  end
end
