class Container
  include Mongoid::Document

  mount_uploader :file, FileUploader, mount_on: :filename
  belongs_to :authentication, autobuild: true
end
