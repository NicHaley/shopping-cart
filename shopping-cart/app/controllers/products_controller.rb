class ProductsController < ApplicationController
	def index
		@products = Product.all
		# A new instance of orderitem is created to be used in our forms
		@order_item = current_order.order_items.new
	end
end
