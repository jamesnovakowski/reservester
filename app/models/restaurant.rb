class Restaurant < ApplicationRecord
	has_many :favorites, dependent: :destroy
	has_many :favorited_by, through: :favorites, source: :user

	has_many :reviews, dependent: :destroy
	has_many :reviewed_by, through: :reviews, source: :user

	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	#paperclip requires the image item be validated.
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	
end
