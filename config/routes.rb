Rails.application.routes.draw do
  root 'businesses#index'

  resources :businesses

  scope :session do
    devise_for :businesses
  end
end
