Rails.application.routes.draw do
  resources :productos
<<<<<<< HEAD
  get 'businesses/index'

  get 'businesses/show'

  root 'businesses#index'
  post 'productos#aumentar', controller:'productos', action: 'aumentar', as: 'aumentar'
  post 'productos#disminuir', controller:'productos', action: 'disminuir', as: 'disminuir'
=======
  root 'directory#index'

>>>>>>> bb7463e952ec4ba3cce08e4014f35a67a10635d4
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
