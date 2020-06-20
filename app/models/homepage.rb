class Homepage < ApplicationRecord
  belongs_to :organization
  belongs_to :event, optional: true
end
