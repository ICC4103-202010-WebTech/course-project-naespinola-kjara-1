class Message < ApplicationRecord
  belongs_to :user_receiver, class_name: 'User'
  belongs_to :user_transmitter, class_name: 'User'
  has_one :message_received
  has_one :message_sent
end
