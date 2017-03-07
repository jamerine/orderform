class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @account = @order.account
    @products = @account.products
    @order_items = @order.order_items
  end

  def new
    @account = Account.find(params[:account_id])
    @products = @account.products
    @order = Order.new
  end

  def create
    @account = Account.find(params[:account_id])
    @order = @account.orders.new(account_id: @account)
    if @order.save
      redirect_to account_order_path(@account, @order.id), notice: "Order Process has begun successfully."
    else
      redirect_to @account, alert: "Order Not Created."
    end
  end


  def order_params
    params.require(:order).permit(:first_name, :last_name, :color_id, :order_id, :unit_price, :quantity, :total_price, :account_id)
  end

end
