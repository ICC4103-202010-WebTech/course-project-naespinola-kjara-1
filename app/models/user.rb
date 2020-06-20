class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization, optional: true
  has_one :profile
  has_many :events
  has_many :comments
  has_many :reports
  has_many :guests
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'user_receiver_id'
  has_many :transmitted_messages, :class_name => 'Message', :foreign_key => 'user_transmitter_id'

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true,  :length => { :minimum => 7 }
  validates :is_organization_admin, inclusion: { in: [true, false] }
  validates :is_system_admin, inclusion: { in: [true, false] }
  validates :in_blacklist, inclusion: { in: [true, false] }

end
