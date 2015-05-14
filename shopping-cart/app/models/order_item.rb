class OrderItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :order

	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validate :product_present
	validate :order_present

	before_save :finalize

	def unit_price
  	# Persisted: Returns true if the record is persisted, i.e. it’s not a new record and it was not destroyed, otherwise returns false.
  	# This means that once the product is added to our cart, if the product changes price the user will still be able to buy the product at the previous price. This is necessary because if the price changes while the user is in checkout, there could be a mismatch between the product price on the cart page and the product price on the checkout page.
  	if persisted?
  		self[:unit_price]
  	else
  		product.price
  	end
  end

  def total_price
  	quantity * unit_price
  end

  private
  def product_present
  	if product.nil?
  		errors.add(:product, "is not valid or is not active.")
  	end
  end

  def order_present
  	if order.nil?
  		errors.add(:order, "is not a valid order.")
  	end
  end

  def finalize
  	self[:unit_price] = unit_price
  	self[:total_price] = quantity * self[:unit_price]
  end
end
