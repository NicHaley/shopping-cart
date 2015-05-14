class Product < ActiveRecord::Base
	has_many :order_items

	# default scope checks if the active flag is set to true. This ensures that deleted/inactive products aren't shown.
	default_scope { where(active: true) }
end
