class SessionsController < ApplicationController
	def new
		@title = "Welcome, the Keymaker!"
	end

	def create
		session[:password] = params[:session][:password]
		redirect_to news_index_path, :flash => { :notice => "Welcome Priyanka-Pranav." }
	end

	def destroy
		reset_session
		redirect_to root_path, :flash => { :notice => "Come back soon!" }
	end
end
