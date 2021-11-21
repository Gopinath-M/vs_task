class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_advocate!

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :mobile, :email, :role_id, :state_id, :experience, :password, :password_confirmation])
	  devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :mobile, :email, :role_id, :state_id, :experience, :password, :password_confirmation])
	end
end
