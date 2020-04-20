class RepliesToComment < ApplicationRecord
  belongs_to :comment_receiver, class_name: 'Comment'
  belongs_to :comment_transmitter, class_name: 'Comment'
end
