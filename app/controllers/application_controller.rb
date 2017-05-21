class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, preprend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    parameters = [:name,
                  :rut,
                  :legal_name,
                  :agent_name,
                  :agent_rut,
                  :phone,
                  :contact_name,
                  :contact_phone,
                  :address]

    devise_parameter_sanitizer.permit(:sign_up, keys: parameters)
    devise_parameter_sanitizer.permit(:account_update, keys: parameters)
  end
end
