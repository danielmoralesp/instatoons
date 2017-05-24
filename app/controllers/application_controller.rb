class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #before_action :add_parameters_to_user, if: :devise_controller?

  #def add_parameters_to_user
  #  devise_parameter_sanitizer.for(:sign_up) << :role
  #  devise_parameter_sanitizer.for(:account_update) << :role
  #end
end
