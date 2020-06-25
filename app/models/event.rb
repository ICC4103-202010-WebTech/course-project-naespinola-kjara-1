class Event < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :organization, optional: true
  has_one :homepage, dependent: :destroy
  has_many :guests, dependent:  :destroy
  has_many :dates_to_votes, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :comments, dependent:  :destroy


  has_one_attached :image, dependent:  :destroy
  mount_uploader :image, ImageUploader
  has_many_attached :documents, dependent:  :destroy
  has_many_attached :videos, dependent:  :destroy
  has_many_attached :pictures, dependent:  :destroy
  def thumbnail input
    self.pictures[input].variant(resize: '300x300').processed
  end



  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :dates_to_votes, allow_destroy: true
  accepts_nested_attributes_for :guests, allow_destroy: true
  accepts_nested_attributes_for :reports

  validates :title, presence: true
  validates :description, presence: true
  validates :private, inclusion: { in: [true, false] }
end
