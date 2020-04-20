class User < ApplicationRecord
  belongs_to :organization
  has_one :profile
  has_many :events
  has_many :comments
  has_one :mailbox
  has_many :guests
  has_many :messages

  validates :username, presence: true, uniqueness: true
  validates :mail, presence: true, uniqueness: true
  validates :password, presence: true,  :length => { :minimum => 7 }
  validates :is_organization_admin, presence: true
  validates :is_system_admin, presence: true
  validates :in_blacklist, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a url for gif, jpg, or png image.'
  }

  validates :document, allow_blank: true, format: {
      with: %r{\.(pdf)\Z}i,
      message: 'must be a url for pdf document.'
  }

  validates :video, allow_blank: true, format: {
      with: %r{\.(mp4|m4v|mov)\Z}i,
      message: 'must be a url for mp4,m4v or mov video.'
  }




end
