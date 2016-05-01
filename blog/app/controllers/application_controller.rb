class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  # rescue_from ActionController::RoutingError, :with => :not_found
  protect_from_forgery with: :exception


  def not_found
    redirect_to root_path
  end
end
