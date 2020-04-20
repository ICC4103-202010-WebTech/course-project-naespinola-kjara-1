class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :wall_of_comment
  has_many :replies_to_comments

  validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a url for gif, jpg, or png image.'
  }
end
