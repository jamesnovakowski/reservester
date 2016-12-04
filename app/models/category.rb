class Category < ApplicationRecord
	has_and_belongs_to_many :restaurants

	#should validate the category name.

	
end
