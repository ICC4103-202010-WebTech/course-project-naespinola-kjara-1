class Organization < ApplicationRecord

  has_one :homepage, dependent: :destroy
  has_many :members, dependent:  :destroy
  has_many :users
  has_many :events, dependent:  :destroy
  has_many :members, dependent: :destroy

  has_one_attached :image, dependent:  :destroy
  mount_uploader :image, ImageUploader
  has_many_attached :documents, dependent:  :destroy
  has_many_attached :videos, dependent:  :destroy
  has_many_attached :pictures, dependent:  :destroy

  def thumbnail input
    self.pictures[input].variant(resize: '300x300').processed
  end


  accepts_nested_attributes_for :homepage
  accepts_nested_attributes_for :members, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true



  validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png|jpeg)\Z}i,
      message: 'must be a gif, jpg, jpeg or png image.'
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
