class Event < ApplicationRecord
  belongs_to :user
  has_one :homepage
  has_many :guests, :dependent => :destroy
  has_many :dates_to_votes, :dependent => :delete_all
  has_many :reports, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :dates_to_votes, allow_destroy: true
  accepts_nested_attributes_for :guests, allow_destroy: true


  validates :title, presence: true
  validates :description, presence: true
  validates :private, inclusion: { in: [true, false] }
  validates :include_organization, inclusion: { in: [true, false] }
end
