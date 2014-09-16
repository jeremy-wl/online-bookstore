class Category < ActiveRecord::Base
	has_many :products, through: :categorizations
	has_many :categorizations
end
