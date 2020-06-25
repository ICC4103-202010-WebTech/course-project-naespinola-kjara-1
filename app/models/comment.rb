class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event, optional: true

  has_many_attached :images, dependent:  :destroy
  def thumbnail input
    self.images[input].variant(resize: '100x100').processed
  end

  has_many :received_comments, :class_name => 'RepliesToComment', :foreign_key => 'comment_receiver_id', dependent:  :destroy
  has_many :transmitted_comments, :class_name => 'RepliesToComment', :foreign_key => 'comment_transmitter_id', dependent:  :destroy

  accepts_nested_attributes_for :user

  validates :rich_text, presence: true
end
