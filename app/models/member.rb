class Member < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  validates :is_admin_org, inclusion: { in: [true, false] }
end
