class Organization < ApplicationRecord

  has_one :homepage
  has_many :members
  has_many :events

  has_one_attached :image
  mount_uploader :image, ImageUploader


  accepts_nested_attributes_for :homepage

  validates :name, presence: true
  validates :description, presence: true



  validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a url for gif, jpg, or png image.'
  }

#  validates :documents, allow_blank: true, format: {
#      with: %r{\.(pdf)\Z}i,
#      message: 'must be a url for pdf document.'
#  }
#
#  validates :videos, allow_blank: true, format: {
#      with: %r{\.(mp4|m4v|mov)\Z}i,
#      message: 'must be a url for mp4,m4v or mov video.'
#  }
end
