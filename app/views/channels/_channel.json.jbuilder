json.extract! channel, :id, :name, :owner_user_id, :created_at, :updated_at
json.url channel_url(channel, format: :json)
