class Upload < ActiveRecord::Base
	include FileUploader[:upload]
	belongs_to :uploadable, polymorphic: true
	belongs_to :user
	belongs_to :folder

	def file_name
		if upload.metadata["filename"]
			upload.metadata["filename"]
		else
			'untitled'
		end
	end

	def download_file
		upload.download
	end

end
