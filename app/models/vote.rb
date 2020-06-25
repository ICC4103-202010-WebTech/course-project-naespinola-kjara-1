class Vote < ApplicationRecord
  belongs_to :guest, optional: true
  belongs_to :dates_to_vote, optional: true
end
