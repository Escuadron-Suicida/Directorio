class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                       :rut,
                                                       :legal_name,
                                                       :agent_name,
                                                       :agent_rut,
                                                       :phone,
                                                       :contact_name,
                                                       :contact_phone,
                                                       :address])
  end
end
