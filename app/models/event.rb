class Event < ApplicationRecord
  belongs_to :user
  has_one :homepage
  has_many :guests
  has_many :dates_to_votes
  has_many :reports
  has_many :comments

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :comments


  validates :title, presence: true
  validates :description, presence: true
  validates :private, inclusion: { in: [true, false] }
  validates :include_organization, inclusion: { in: [true, false] }
end
