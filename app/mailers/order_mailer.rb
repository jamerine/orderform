class OrderMailer < ApplicationMailer
  default :from => "jason@dittoh.com"

  def order_email(account_id, order_id, pdf)
    @account = Account.find(account_id)
    @order = Order.find(order_id)
    pdf = OrderInvoicePdf.new(@account, @order, view_context)
    attachments["order_invoice.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => @order.email, :subject => "#{ @account.business_name } Bulk Order")
  end

end
