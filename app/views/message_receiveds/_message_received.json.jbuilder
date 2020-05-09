json.extract! message_received, :id, :created_at, :updated_at
json.url message_received_url(message_received, format: :json)
