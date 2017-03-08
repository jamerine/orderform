class OrderMailer < ApplicationMailer
  default :from => "jason@dittoh.com"

  def order_email(account_id, order_id)
    @account = Account.find(account_id)
    @order = Order.find(order_id)
    mail(:to => "#{@order.email}", :subject => "#{ @account.business_name } Bulk Order")
  end

end
