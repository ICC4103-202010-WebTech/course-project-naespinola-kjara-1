class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :received_comments, :class_name => 'RepliesToComment', :foreign_key => 'comment_receiver_id'
  has_many :transmitted_comments, :class_name => 'RepliesToComment', :foreign_key => 'comment_transmitter_id'

  accepts_nested_attributes_for :user

  validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a url for gif, jpg, or png image.'
  }
  validates :rich_text, presence: true
end
