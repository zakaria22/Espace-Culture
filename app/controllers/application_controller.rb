class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :config_parameters, if: :devise_controller?

  protected 
  	def config_parameters
  		devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :birthday, :email, :password, :remember_me, :picture)}
  		devise_parameter_sanitizer.for(:sign_in) {|u| u.permit( :email, :password, :remember_me)} 		
  		devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name, :birthday, :about,:average_movies, :read_more, :document,:email, :password, :current_password, :remember_me, :picture)}
  	end
end
