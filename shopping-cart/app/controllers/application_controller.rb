class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
  	# If session[:order_id] is not nil, return the current session order, else create a new Order
  	if !session[:order_id].nil?
  		Order.find(session[:order_id])
  	else
  		Order.new
  	end
  end
end
