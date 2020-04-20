class Event < ApplicationRecord
  belongs_to :user
  has_many :guests
  has_many :dates_to_votes
  has_one :wall_of_comment
  has_many :reports
  has_one :homepage

  validates :tittle, presence: true
  validates :description, presence: true
  validates :private, inclusion: { in: [true, false] }
  validates :include_organization, inclusion: { in: [true, false] }
end
