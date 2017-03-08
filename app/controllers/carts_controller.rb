class CartsController < ApplicationController
  def show
    @order = Order.find(params[:order_id])
    @order_items = @order.order_items
    @account = @order.account
  end


end
