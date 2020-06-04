class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :votes

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :event
end
