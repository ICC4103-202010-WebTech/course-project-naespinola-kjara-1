class Homepage < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :event, optional: true
end
