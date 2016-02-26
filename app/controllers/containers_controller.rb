class ContainersController < ApplicationController
	before_action :check_authentication
	

	def index
		@email = Authentication.find(session[:authentication_id]).email
		@containers = Container.where( :authentication_id => session[:authentication_id] )
	end

	def delete
		Container.find(params[:id]).destroy;
		redirect_to files_path
	end

	def upload
		for item in params[:container][:files]
			f = Container.new
			f.file = item
			f.authentication_id = session[:authentication_id]
			f.save!
		end
		redirect_to files_path
	end

	def download
		container = Container.find(params[:id])
		content = container.data.read
		send_data content, type: container.data.file.content_type, disposition: "inline"
		expires_in 0, public: true
	end

	private 
		def check_authentication
			if session[:authentication_id] == nil
				redirect_to root_path
			end
		end


end
