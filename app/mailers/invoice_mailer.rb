class InvoiceMailer < ApplicationMailer
  default :from => "jason@dittoh.com"

  def invoice_email(account_id, order_id)
    @account = Account.find(account_id)
    @order = Order.find(order_id)
    mail(:to => @account.email_address, :subject => "New Bulk Order")
  end

end
