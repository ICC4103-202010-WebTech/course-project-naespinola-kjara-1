class Admin < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable -- admins  are not registerable!
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

end
