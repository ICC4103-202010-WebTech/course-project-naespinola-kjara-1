class DatesToVote < ApplicationRecord
  belongs_to :event, optional: true
  has_many :votes, dependent:  :destroy
end
