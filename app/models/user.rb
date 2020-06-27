class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  has_one_attached :image, dependent: :destroy
  mount_uploader :image, ImageUploader

  has_many :votes, dependent:  :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :messages, dependent: :destroy, foreign_key: 'user_transmitter_id'
  has_many :members, dependent: :destroy
  has_many :organizations, through: :members

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :password, presence: true,  :length => { :minimum => 6 }
  validates :in_blacklist, inclusion: { in: [true, false] }

  attr_accessor :terms_of_service
  validates :terms_of_service, acceptance: true, on: :create

  validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a url for gif, jpg, or png image.'
  }

  def admin?
    false
  end

  def user?
    true
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid    ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
            provider:access_token.provider,
            email: data["email"],
            uid: access_token.uid ,
            password: "1234567",
            )
      end
    end
  end



end
