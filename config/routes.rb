Rails.application.routes.draw do
  resources :productos
  root 'directory#index'

  resources :products

  resources :businesses

  resources :messages

  scope :session do
    devise_for :businesses
  end

  get 'admin/index'

  unauthenticated :user do
                devise_scope :user do
                        root 'admin#unregistered', as: :unregistered_root
                end
        end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
