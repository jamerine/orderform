class OrderInvoicePdf < Prawn::Document

  def initialize(account, order, view_context)
    super()
    @account = account
    @order = order
    @view = view_context
    header
    move_down 50
    shipping_details
    billing_details
    move_down 25
    order_details
    move_down 50
    footer
  end

  private


  def logo
    logopath =  "#{Rails.root}/public/#{ @account.logo_url(:thumb) }"
    image logopath, :width => 50, :height => 50
  end

  def header
    logo
      move_down 30
    text "2017 #{ @account.business_name } Order Invoice", size: 14, style: :bold, align: :center
    text "Spring Bulk", size: 14, style: :bold, align: :center
  end

  def shipping_details
    bounding_box([0, 550], :width => 275, :height => 125) do
      text "Shipping Details:", size: 12, style: :bold
      text "#{ @order.shipping_first_name } #{ @order.shipping_last_name}", size: 11, :indent_paragraphs => 30
      text "#{ @order.shipping_address_line_1 }, #{ @order.shipping_address_line_2}", size: 11, :indent_paragraphs => 30
      text "#{ @order.shipping_city }, #{ @order.shipping_state} #{ @order.shipping_zip_code}" , size: 11, :indent_paragraphs => 30
      text "#{ @order.shipping_phone_number}", size: 11, :indent_paragraphs => 30
      text "#{ @order.shipping_email}", size: 11, :indent_paragraphs => 30
      transparent(0) { stroke_bounds }
    end
  end

  def billing_details
    bounding_box([275, 550], :width => 275, :height => 125) do
      text "Billing Details:", size: 11, style: :bold
      text "#{ @order.billing_first_name } #{ @order.billing_last_name}", size: 11, :indent_paragraphs => 30
      text "#{ @order.billing_address_line_1 }, #{ @order.billing_address_line_2}", size: 11, :indent_paragraphs => 30
      text "#{ @order.billing_city }, #{ @order.billing_state} #{ @order.billing_zip_code}" , size: 11, :indent_paragraphs => 30
      text "#{ @order.billing_phone_number}", size: 11, :indent_paragraphs => 30
      text "#{ @order.billing_email}", size: 11, :indent_paragraphs => 30
      text "Branch #: #{ @order.billing_branch_number}", size: 11, :indent_paragraphs => 30
      transparent(0) { stroke_bounds }
    end

  end

  def order_details
    text "Order Details:", size: 12, style: :bold
    table order_details_data, :column_widths => { 0 => 140, 1 => 90, 2 => 100, 3 => 65, 4 => 70, 5 => 70 } do
      self.position = :center
      row(0).font_style = :bold
      row(-1).font_style = :bold
      row(0).overflow = :shrink_to_fit
      row(0).align = :center

      row(-1).borders = [:top]
      # row(1).columns(0..14).borders = []
      row(1..-2).columns(0..5).align = :left
      row(1..-2).columns(6).align = :right
      row(-1).align = :right
      self.cell_style = { size: 10 }
      self.header = true
    end
  end

  def order_details_data
    @data = [["Name", "Item", "Color", "Size", "Quantity", "Total"]]
    @data += @order.order_items.map { |e| [e.product.name, e.product.item_number, e.color.name, e.size.name, e.quantity, "#{price(e.total_price)}"] }
    @data += [[{:content => "", :colspan => 2}, {:content => "Subtotal", :colspan => 2}, {:content => "#{price(@order.subtotal)}", :colspan => 2} ]]
  end


  def footer
    text "Questions? Contact Mary:", style: :bold
    text "Phone: #{ @account.phone_number}",:indent_paragraphs => 30
    text "Email: #{ @account.email_address}",:indent_paragraphs => 30
    text "Fax: #{ @account.fax_number}",:indent_paragraphs => 30
  end


  def price(num)
    @view.number_to_currency(num)
  end


end
