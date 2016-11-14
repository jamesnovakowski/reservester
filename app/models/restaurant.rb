class Restaurant < ApplicationRecord
	has_many :favorites, dependent: :destroy
	has_many :favorited_by, through: :favorites

	has_many :reviews, dependent: :destroy
	has_many :reviewed_by, through: :reviews
end
