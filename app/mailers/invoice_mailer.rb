class InvoiceMailer < ApplicationMailer
  default :from => "jason@dittoh.com"

  def invoice_email(account_id, order_id, pdf)
    @account = Account.find(account_id)
    @order = Order.find(order_id)
    pdf = OrderInvoicePdf.new(@account, @order, view_context)
    attachments["order_invoice.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => @account.email_address, :subject => "New Bulk Order")
  end

end
