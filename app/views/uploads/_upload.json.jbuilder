json.extract! upload, :id, :upload_data, :user_id, :uploadable_id, :uploadable_type, :created_at, :updated_at
json.url upload_url(upload, format: :json)