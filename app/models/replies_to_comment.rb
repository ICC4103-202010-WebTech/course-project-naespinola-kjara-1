class RepliesToComment < ApplicationRecord
  belongs_to :comment_receiver, class_name: 'Comment', optional: true
  belongs_to :comment_transmitter, class_name: 'Comment', optional: true
end
