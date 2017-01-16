require 'shrine/storage/s3'

s3_options = {
  access_key_id:     Rails.application.secrets.aws_access_key_id,
  secret_access_key: Rails.application.secrets.aws_secret_access_key,
  region:            Rails.application.secrets.aws_region,
  bucket:            Rails.application.secrets.aws_bucket
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: 'cache', host: 'https://cdn.syook.com', **s3_options),
  store: Shrine::Storage::S3.new(prefix: 'store', host: 'https://cdn.syook.com', **s3_options)
}

Shrine.plugin :activerecord
Shrine.plugin :direct_upload
Shrine.plugin :restore_cached_data
Shrine.plugin :upload_options
# Shrine.plugin :backgrounding

# Shrine::Attacher.promote do |data|
#   # tells a Sidekiq worker to perform in 3 seconds
#   PromoteJob.delay.perform(data)
# end
