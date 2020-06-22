class User < ApplicationRecord


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  mount_uploader :image, ImageUploader

  has_one :profile, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'user_receiver_id'
  has_many :transmitted_messages, :class_name => 'Message', :foreign_key => 'user_transmitter_id'

  has_many :organizations, through: :members

  #validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :password, presence: true,  :length => { :minimum => 6 }
  validates :in_blacklist, inclusion: { in: [true, false] }

  validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a url for gif, jpg, or png image.'
  }



end
