class Upload < ActiveRecord::Base
	include FileUploader[:upload]
	belongs_to :uploadable, polymorphic: true
	belongs_to :user
end
