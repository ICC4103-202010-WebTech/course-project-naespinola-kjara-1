class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :votes
end
