class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_one :homepage
  has_many :guests, dependent:  :destroy
  has_many :dates_to_votes, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :comments, dependent:  :destroy

  has_one_attached :image
  mount_uploader :image, ImageUploader
  has_many_attached :documents
  mount_uploader :documents, DocumentUploader
  has_many_attached :videos
  mount_uploader :videos, VideoUploader



  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :dates_to_votes, allow_destroy: true
  accepts_nested_attributes_for :guests, allow_destroy: true


  validates :title, presence: true
  validates :description, presence: true
  validates :private, inclusion: { in: [true, false] }
  validates :include_organization, inclusion: { in: [true, false] }
end
