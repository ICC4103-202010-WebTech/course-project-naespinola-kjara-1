class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a url for gif, jpg, or png image.'
  }

  validates :document, allow_blank: true, format: {
      with: %r{\.(pdf)\Z}i,
      message: 'must be a url for pdf document.'
  }

  validates :video, allow_blank: true, format: {
      with: %r{\.(mp4|m4v|mov)\Z}i,
      message: 'must be a url for mp4,m4v or mov video.'
  }
end
