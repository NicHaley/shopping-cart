class Order < ActiveRecord::Base
	belongs_to :order_status
	has_many :order_items
	before_create :set_order_status
	before_save :update_subtotal

	def subtotal
		order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
	end

	private
	def set_order_status
  	# Order_status_id = 1 is 'In Progress'
  	self.order_status_id = 1
  end

  # Update the subtotal before saving based on the subtotal method above
  def update_subtotal
  	self[:subtotal] = subtotal
  end
end
