namespace :custom do
	desc "Getting a environment"
	task :env => :environment do
		puts "Environment - #{Rails.env}";
	end
end
