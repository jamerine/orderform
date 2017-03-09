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
    @order = @account.orders.new(account_id: @account)
  end

  def create
    @account = Account.find(params[:account_id])
    @order = @account.orders.new(order_params)
    if @order.save
      redirect_to account_order_path(@account, @order.id), notice: "Order Process has begun successfully."
    else
      redirect_to @account, alert: "Order Not Created."
    end
  end

  def shipping_details
    @order = Order.find(params[:order_id])
    @order_items = @order.order_items
    @account = @order.account
  end

  def shipping_details_save
    @order = Order.find(params[:order_id])
    @account = @order.account
    @order.assign_attributes(order_params)
    @order.assign_attributes(status: 1)
    if @order.save
      pdf = OrderInvoicePdf.new(@account, @order, view_context)
      OrderMailer.order_email(@account.id, @order.id, pdf).deliver
      InvoiceMailer.invoice_email(@account.id, @order.id, pdf).deliver
      redirect_to @account, notice: 'Order has been placed. Please check your email for an receipt of your order.'
    else
      redirect_to @order, notice: 'There was an error with placing the order.  Please try again.'
    end
  end

  def order_invoice_pdf
    @account = Account.find(params[:account_id])
    @order = Order.find(params[:order_id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderInvoicePdf.new(@account, @order, view_context)
        send_data pdf.render, filename: "#{ @account.business_name }_order_#{ @order.id }.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :phone_number, :address_line_1, :address_line_2, :city, :state, :zip_code, :color_id, :order_id, :unit_price, :quantity, :total_price, :account_id)
  end

end
