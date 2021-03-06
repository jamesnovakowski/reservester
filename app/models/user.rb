class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #before_action :authenticate_user!
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_restaurants, through: :favorites, source: :restaurant

  has_many :reviews, dependent: :destroy
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant

  has_many :restaurants, dependent: :destroy #Consider removing dependent: :destroy?

  has_many :reservations, dependent: :destroy
  has_many :reserved_restaurants, through: :reservations, source: :restaurant

  #Should add some validation for having name and email address

  def is_owner?
    return true if self.role == "owner"
    return false
  end

  def is_patron?
    return true if self.role == "patron"
    return false
  end

end
