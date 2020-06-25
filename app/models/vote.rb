class Vote < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :dates_to_vote, optional: true

  accepts_nested_attributes_for :dates_to_vote
  accepts_nested_attributes_for :user

end
