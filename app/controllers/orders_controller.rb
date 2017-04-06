class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @account = @order.account
    @products = @account.products.order(:ordering_number)
    @order_items = @order.order_items
  end

  def new
    @account = Account.find(params[:account_id])
    @products = @account.products.order(:ordering_number)
    @order = @account.orders.new(account_id: @account)
  end

  def create
    @account = Account.find(params[:account_id])
    @order = @account.orders.new(order_params)
    @product_logo = @account.product_logos.find(params[:order][:id])
    @order.assign_attributes(product_logo: @product_logo.product_logo_image, product_logo_name: @product_logo.name)
    if params[:order][:same_as_billing]
      @order.assign_attributes(
      shipping_first_name: params[:order][:billing_first_name],
      shipping_last_name: params[:order][:billing_last_name],
      shipping_email: params[:order][:billing_email],
      shipping_phone_number: params[:order][:billing_phone_number] ,
      shipping_address_line_1: params[:order][:billing_address_line_1],
      shipping_address_line_2: params[:order][:billing_address_line_2],
      shipping_city: params[:order][:billing_city],
      shipping_state: params[:order][:billing_state],
      shipping_zip_code: params[:order][:billing_zip_code],
      shipping_branch_number: params[:order][:billing_branch_number])
    end

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
    @product_logo = @account.product_logos.find(params[:order][:id])
    @order.assign_attributes(product_logo: @product_logo.product_logo_image, product_logo_name: @product_logo.name)
    @order.assign_attributes(status: 1)
    if @order.save
      pdf = OrderInvoicePdf.new(@account, @order, view_context)
      OrderMailer.order_email(@account.id, @order.id, pdf).deliver
      InvoiceMailer.invoice_email(@account.id, @order.id, pdf).deliver
      redirect_to @account, notice: 'Your order has been placed. Please check your email for receipt of the order confirmation.'
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
    params.require(:order).permit(:shipping_first_name, :shipping_last_name, :shipping_email, :shipping_phone_number, :shipping_address_line_1, :shipping_address_line_2, :shipping_city, :shipping_state, :shipping_zip_code, :billing_first_name, :billing_last_name, :billing_email, :billing_phone_number, :billing_address_line_1, :billing_address_line_2, :billing_city, :billing_state, :billing_zip_code, :order_id, :account_id, :same_as_billing,  :status, :subtotal, :tax, :shipping, :total, :shipping_branch_number, :billing_branch_number, :product_logo, :product_logo_name, :pc_id_number)
  end

end
