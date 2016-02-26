namespace :custom do
	desc "Compile"
	task :compile do
		Dir.chdir File.join( ENV['base_path'], 'config' ) do |dir|
			put dir
			#file_compass_config = "/path/to/some/different/config.rb"

			#system "compass compile -c #{file_compass_config} --force"
		end
	end
end
