class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin?

  protected

  def admin?
    session[:password] == ENV['PASSWORD']
  end

  def authenticate
    return true if admin?

    flash[:alert] = "Wooahh! What did you just do?"
    redirect_to root_path
    false
  end
end
