json.extract! event, :title, :description, :private, :include_organization,
              :image,:videos, :documents, :location, :created_at, :updated_at
json.url api_v1_event_url(event, format: :json)