class OrderItemsController < ApplicationController
	before_filter :load_order

	def create
		@order_item = @order.order_items.new(order_item_params)
		@order.save
		# Save the current order to the session
		session[:order_id] = @order.id
	end

	def update
		@order_item = @order.order_items.find(params[:id])
		@order_item.update_attributes(order_item_params)
		@order_items = @order.order_items
	end

	def destroy
		@order_item = @order.order_items.find(params[:id])
		@order_item.destroy
		@order_items = @order.order_items
	end

	private
	def load_order
		@order = current_order
	end

	def order_item_params
		params.require(:order_item).permit(:quantity, :product_id)
	end
end
