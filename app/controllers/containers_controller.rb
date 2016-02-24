class ContainersController < ApplicationController
	before_action :check_authentication
	

	def index
		@files = Container.all
	end

	def delete

	end

	def upload
		for file in params[:container][:files]
			f = Container.new
			f.data = file
			f.save!
		end
	end

	def download
		container = Container.find(params[:id])
		content = container.data.read
		send_data content, type: container.data.file.content_type, disposition: "inline"
		expires_in 0, public: true
	end

	private 
		def check_authentication
			if session[:current_user_id] == nil
	    		redirect_to root_path
	    	end
		end


end
