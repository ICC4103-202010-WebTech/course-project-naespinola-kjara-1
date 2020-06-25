class Guest < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :event, optional: true
  has_many :votes, dependent:  :destroy

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :event
end
