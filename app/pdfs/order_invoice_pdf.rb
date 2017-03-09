class OrderInvoicePdf < Prawn::Document

  def initialize(account, order, view)
    super()
    @account = account
    @order = order
    @view = view
    header
    move_down 50
    shipping_details
    move_down 75
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
    text "Spring Promo", size: 14, style: :bold, align: :center
  end

  def shipping_details
    text "Shipping Details:", size: 12, style: :bold
    text "#{ @order.first_name } #{ @order.last_name}", size: 12, :indent_paragraphs => 30
    text "#{ @order.address_line_1 }, #{ @order.address_line_2}", size: 12, :indent_paragraphs => 30
    text "#{ @order.city }, #{ @order.state} #{ @order.zip_code}", size: 12, :indent_paragraphs => 30
    text "#{ @order.phone_number }  #{ @order.email}", size: 12, :indent_paragraphs => 30
  end

  def order_details
    text "Order Details:", size: 12, style: :bold
    table order_details_data, :column_widths => { 0 => 130, 1 => 85, 2 => 40, 3 => 100, 4 => 65, 5 => 50, 6 => 70 } do
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
    @data = [["Name", "Item", "Style", "Color", "Size", "Quan.", "Total"]]
    @data += @order.order_items.map { |e| [e.product.name, e.product.item_number, e.product.style_number, e.color.name, e.size.name, e.quantity, price(e.total_price)] }
    @data += [[{:content => "", :colspan => 3}, {:content => "Subtotal", :colspan => 2}, {:content => "#{price(@order.subtotal)}", :colspan => 2} ]]
  end


  def footer
    text "Questions? Contact Mary:", style: :bold
    text "Phone: (608)-755-0144",:indent_paragraphs => 30
    text "Email: mary@mmpric.net",:indent_paragraphs => 30
    text "Fax: (608) 755-0889",:indent_paragraphs => 30
  end


  def price(num)
    @view.number_to_currency(num)
  end


end
