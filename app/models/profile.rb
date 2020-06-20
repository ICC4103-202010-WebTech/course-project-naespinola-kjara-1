class Profile < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :location

  has_one_attached :image
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :location

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
