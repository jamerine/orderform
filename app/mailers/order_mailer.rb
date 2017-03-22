class OrderMailer < ApplicationMailer

  def order_email(account_id, order_id, pdf)
    @account = Account.find(account_id)
    @order = Order.find(order_id)
    pdf = OrderInvoicePdf.new(@account, @order, view_context)
    attachments["order_invoice.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => @order.shipping_email, :subject => "#{ @account.business_name } Bulk Order", :from => @account.email_address)
  end

end
