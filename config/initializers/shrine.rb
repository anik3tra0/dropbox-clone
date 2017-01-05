# require 'shrine'
# require 'shrine/storage/file_system'

# Shrine.storages = {
#   cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
#   store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'), # permanent
# }

# Shrine.plugin :activerecord
# Shrine.plugin :cached_attachment_data # for forms

require "shrine/storage/s3"

s3_options = {
  access_key_id:     Rails.application.secrets.aws_access_key_id,
  secret_access_key: Rails.application.secrets.aws_secret_access_key,
  region:            Rails.application.secrets.aws_region,
  bucket:            Rails.application.secrets.aws_bucket,
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}

Shrine.plugin :activerecord
# Shrine.plugin :cached_attachment_data
Shrine.plugin :direct_upload
Shrine.plugin :restore_cached_data