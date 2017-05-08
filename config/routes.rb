Rails.application.routes.draw do
  resources :businesses

  scope :session do
    devise_for :businesses
  end
end
