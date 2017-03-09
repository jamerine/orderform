class OrderWorker
  include Sidekiq::Worker

  sidekiq_options queue: :order

  def perform(account_id, order_id, view_context)
    @account = Account.find(account_id)
    @order = Order.find(order_id)
    @view = view_context
    pdf = OrderInvoicePdf.new(@account, @order)
    OrderMailer.order_email(@account.id, @order.id, pdf).deliver
    InvoiceMailer.invoice_email(@account.id, @order.id, pdf).deliver

  end
end
