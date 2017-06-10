Rails.application.routes.draw do
  resources :productos
  get 'businesses/index'

  get 'businesses/show'

  root 'businesses#index'
  post 'productos#aumentar', controller:'productos', action: 'aumentar', as: 'aumentar'
  post 'productos#disminuir', controller:'productos', action: 'disminuir', as: 'disminuir'
  
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
