class OrderWorker
  include Sidekiq::Worker

  sidekiq_options queue: :order

  def perform(account_id, order_id)
    @account = Account.find(account_id)
    @order = Order.find(order_id)
    OrderMailer.order_email(@account.id, @order.id).deliver
    InvoiceMailer.invoice_email(@account.id, @order.id).deliver

  end
end
