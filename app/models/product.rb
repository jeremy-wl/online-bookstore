class Product < ActiveRecord::Base
	validates :title, :description, :price, :presence => true
	validates :title, :uniqueness => true,
					  :length => { minimum: 10 }
	validates :image_url, allow_blank: true, :format => {
		with: %r{\.(gif|jpg|png)\Z}i,	# but it's okay if blank
		message: 'must be a URL for GIF, JPG or PNG image'
	}
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }

	def self.latest
		Product.order(:updated_at).last  # Defined for the caching in store index
	end

end