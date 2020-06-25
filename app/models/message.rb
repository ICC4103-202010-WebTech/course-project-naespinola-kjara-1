class Message < ApplicationRecord
  belongs_to :user_receiver, class_name: 'User', optional: true
  belongs_to :user_transmitter, class_name: 'User', optional: true
  has_one :message_received, dependent:  :destroy
  has_one :message_sent,dependent:  :destroy
end
