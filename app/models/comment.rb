class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :wall_of_comment

  has_many :received_comment, :class_name => 'RepliesToComment', :foreign_key => 'comment_receiver_id'
  has_many :transmitted_comment, :class_name => 'RepliesToComment', :foreign_key => 'comment_transmitter_id'

  validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a url for gif, jpg, or png image.'
  }
end
