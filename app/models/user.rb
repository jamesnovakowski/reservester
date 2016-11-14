class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #before_action :authenticate_user!
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_restaurants, through: :favorites

  has_many :reviews, dependent: :destroy
  has_many :reviewed_restaurants, through: :reviews

end
