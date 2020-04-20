class Vote < ApplicationRecord
  belongs_to :guest
  belongs_to :dates_to_vote
end
