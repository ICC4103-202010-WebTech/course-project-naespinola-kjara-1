class Member < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :organization, optional: true

  validates :is_admin_org, inclusion: { in: [true, false] }
end
