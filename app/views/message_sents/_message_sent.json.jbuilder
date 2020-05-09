json.extract! message_sent, :id, :created_at, :updated_at
json.url message_sent_url(message_sent, format: :json)
