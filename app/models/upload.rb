class Upload < ActiveRecord::Base
	include FileUploader[:upload]
	belongs_to :uploadable, polymorphic: true
end
