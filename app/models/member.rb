class Member < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :organization, optional: true

  validates :is_admin_org, inclusion: { in: [true, false] }

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :organization
end
