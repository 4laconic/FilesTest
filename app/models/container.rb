class Container
  include Mongoid::Document

  mount_uploader :file, FileUploader
  belongs_to :user
end
