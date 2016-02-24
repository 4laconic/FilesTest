class AuthenticationsController < ApplicationController
	before_action :check_authentication, only: [:welcome, :login]

	def welcome 

	end

	def login
		@params = login_params		
		@auth = Authentication.find_by(email: @params[:email])
		result = :failure
		if !@auth.nil?
			encrypted_password = BCrypt::Engine::hash_secret(@params[:password], @auth.salt)
			if (encrypted_password == @auth.encrypted_password)
				result = :success
			end
		end		
		case result			
			when :success
				session[:current_user_id] = @auth.id
				flash[:success] = 'You are successfully logged'
			when :failure
				flash[:failure] = "You aren't logged"
		end
	end

	def logout
		reset_session
		redirect_to root_path
	end

	def signup
		@params = signup_params
		if Authentication.find_by(email: @params[:email]).nil?
			@auth = Authentication.new 	email: @params[:email], 
										password: @params[:password]
			if @auth.save 
				session[:current_user_id] = @auth.id
				flash[:success] = 'You are successfully signup'
				response.header['Location'] = files_url()
				response.header['URL'] = files_url()
				response.header['Refresh'] = '2'
				

			else
				flash[:failure] = "You aren't signup"
			end
		end
	end

	private
	    def login_params
			params.require(:authentication).permit(:email, :password)
	    end

	    def signup_params
	      params.require(:authentication).permit(:email, :password)
	    end

	    def check_authentication
	    	if session[:current_user_id] != nil
	    		redirect_to files_path
	    	end
	    end
end
