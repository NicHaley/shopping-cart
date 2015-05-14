class CartsController < ApplicationController
  def show
  	# Set @order_items equal to the current_order (defined in the application controller)
  	@order_items = current_order.order_items
  end
end
