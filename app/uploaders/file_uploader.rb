class FileUploader < Shrine
  # plugins and uploading logic
  plugin :remote_url, max_size: 20 * 1024 * 1024
end
