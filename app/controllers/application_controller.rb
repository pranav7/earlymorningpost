class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :admin?

  protected

  	def admin?
  		session[:password] == 'theKeyMaker'
  	end

  	def authenticate
  		unless admin?
  			flash[:alert] = "Wooahh! What did you just do?"
  			redirect_to root_path
			  false
		  end
  	end

end
