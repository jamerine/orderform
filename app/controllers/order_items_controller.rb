class OrderItemsController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
    @order = Order.find(params[:order_id])
    @product = Product.find(params[:id])
    @colors = @product.colors
    @sizes = @product.sizes
    @order_item = @order.order_items.new
  end

  def create
    @account = Account.find(params[:account_id])
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.new(order_item_params)

    if @order.save
      redirect_to account_order_path(@account, @order), notice: 'Order Item has been added.'
    else
      redirect_to @order, alert: 'There was an error adding the item.'
    end
  end

  def show
    @order = current_order
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    if @order_item.destroy
      redirect_to cart_path(order_id: @order_item.order.id), notice: 'Order Item deleted.'
    else
      redirect_to cart_path(order_id: @order_item.order.id), alert: 'Unable to delete.'
    end

  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :size_id, :color_id, :order_id, :unit_price, :quantity, :total_price)
  end
end
