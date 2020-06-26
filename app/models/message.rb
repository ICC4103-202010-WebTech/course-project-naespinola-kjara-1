class Message < ApplicationRecord
  belongs_to :user_receiver, class_name: 'User', :foreign_key => 'user_receiver_id'
  belongs_to :user_transmitter, class_name: 'User',  :foreign_key => 'user_transmitter_id'

end
