# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  @user = User.create(email: 'jason@dittoh.com', password: 'Jamrine08', password_confirmation: 'Jamrine08')
  @user = User.create(email: 'millercj320@gmail.com', password: 'password', password_confirmation: 'password')



################### START PRODUCT ########################



@account_1 = Account.create(business_name: 'L&W Supply', address_line_1: "117 West Hubbard Ave.", address_line_2: "Apt B", subdomain: 'lw_supply' )
  File.open('/Users/jasonamerine/Dittoh/LW Supply Images/logo_1489074486__46655.jpg') do |f|
    @account_1.logo = f
  end
  @account_1.save


@product_1 = @account_1.products.create(name: 'Hooded Sweatshirt', item_number: 'LWSP17-100', style_number: 'G185', description: '8 oz. 50/50. 3 color screen. Front pouch pocket.
')

  @color_1 = @product_1.colors.create(name: 'Safety Green', hex_color: '#C6D219'  )
  @color_1.save

  @color_2 = @product_1.colors.create(name: 'Sports Grey', hex_color: '#97999B'  )
  @color_2.save

  @size_1 = @product_1.sizes.create(name: 'SM', price: 16.00)
  @size_2 = @product_1.sizes.create(name: 'MD', price: 16.00)
  @size_3 = @product_1.sizes.create(name: 'LG', price: 16.00)
  @size_4 = @product_1.sizes.create(name: 'XL', price: 16.00)
  @size_5 = @product_1.sizes.create(name: '2XL', price: 19.00)
  @size_6 = @product_1.sizes.create(name: '3XL', price: 21.50)



################### END PRODUCT ########################


################### START PRODUCT ########################

  @product_2 = @account_1.products.create(name: 'Short Sleeve T-Shirt', item_number: 'LWSP17-101', style_number: 'G200', description: '6 oz. pre-shrunk 100% cotton. Safety Green is compliant with ANSI High Visibility Standards.')

    @color_1 = @product_2.colors.create(name: 'Safety Green', hex_color: '#C6D219'  )
    @color_1.save

    @size_1 = @product_2.sizes.create(name: 'SM', price: 4.25)
    @size_2 = @product_2.sizes.create(name: 'MD', price: 4.25)
    @size_3 = @product_2.sizes.create(name: 'LG', price: 4.25)
    @size_4 = @product_2.sizes.create(name: 'XL', price: 4.25)
    @size_5 = @product_2.sizes.create(name: '2XL', price: 6.50)
    @size_6 = @product_2.sizes.create(name: '3XL', price: 7.50)

################### END PRODUCT ########################

################### START PRODUCT ########################

  @product_3 = @account_1.products.create(name: 'Short Sleeve T-Shirt  "Values Shirt', item_number: 'LWSP17-102', style_number: 'G200', description: '6.0 oz., pre-shrunk 100% cotton.')

    @color_1 = @product_3.colors.create(name: 'Sports Grey', hex_color: '#97999B'  )
    @color_1.save

    @size_1 = @product_3.sizes.create(name: 'SM', price: 5.00)
    @size_2 = @product_3.sizes.create(name: 'MD', price: 5.00)
    @size_3 = @product_3.sizes.create(name: 'LG', price: 5.00)
    @size_4 = @product_3.sizes.create(name: 'XL', price: 5.00)
    @size_5 = @product_3.sizes.create(name: '2XL', price: 7.50)
    @size_6 = @product_3.sizes.create(name: '3XL', price: 8.50)

################### END PRODUCT ########################

################### START PRODUCT ########################

  @product_4 = @account_1.products.create(name: "Men's Snag Protection Polo", item_number: 'LWSP17-103', style_number: 'TT21', description: '4.42 oz. 100% polyester. Embroidery 3 color. Snag-protection piqué with moisture-wicking.  UV protection performance & anti-microbia.')

    @color_1 = @product_4.colors.create(name: 'White', hex_color: '#FFFFFF'  )
    @color_1.save

    @color_2 = @product_4.colors.create(name: 'Sports Dark Navy', hex_color: '#293454'  )
    @color_2.save

    @color_3 = @product_4.colors.create(name: 'Black', hex_color: '#000000'  )
    @color_3.save

    @size_1 = @product_4.sizes.create(name: 'SM', price: 14.50)
    @size_2 = @product_4.sizes.create(name: 'MD', price: 14.50)
    @size_3 = @product_4.sizes.create(name: 'LG', price: 14.50)
    @size_4 = @product_4.sizes.create(name: 'XL', price: 14.50)
    @size_5 = @product_4.sizes.create(name: '2XL', price: 15.50)
    @size_6 = @product_4.sizes.create(name: '3XL', price: 16.00)
    @size_7 = @product_4.sizes.create(name: '4XL', price: 17.50)

################### END PRODUCT ########################

################### START PRODUCT ########################

  @product_5 = @account_1.products.create(name: "Ladies Snag Protection Polo", item_number: 'LWSP17-104', style_number: 'TT21W', description: '4.42 oz. 100% polyester. Embroidery 3 color. Snag-protection piqué with moisture-wicking.  UV protection performance & anti-microbia.')

    @color_1 = @product_5.colors.create(name: 'White', hex_color: '#FFFFFF'  )
      File.open('/Users/jasonamerine/Dittoh/LW Supply Images/womens_polo_white.jpg') do |f|
        @color_1.color_sample = f
      end
    @color_1.save

    @color_2 = @product_5.colors.create(name: 'Sports Dark Navy', hex_color: '#293454'  )
      File.open('/Users/jasonamerine/Dittoh/LW Supply Images/womens_polo_navy.jpg') do |f|
        @color_2.color_sample = f
      end
    @color_2.save

    @color_3 = @product_5.colors.create(name: 'Black', hex_color: '#000000'  )
      File.open('/Users/jasonamerine/Dittoh/LW Supply Images/womens_polo.jpg') do |f|
        @color_3.color_sample = f
      end
    @color_3.save

    @size_1 = @product_5.sizes.create(name: 'SM', price: 14.50)
    @size_2 = @product_5.sizes.create(name: 'MD', price: 14.50)
    @size_3 = @product_5.sizes.create(name: 'LG', price: 14.50)
    @size_4 = @product_5.sizes.create(name: 'XL', price: 14.50)
    @size_5 = @product_5.sizes.create(name: '2XL', price: 15.50)
    @size_6 = @product_5.sizes.create(name: '3XL', price: 16.00)

################### END PRODUCT ########################

################### START PRODUCT ########################

  @product_6 = @account_1.products.create(name: "Men's Full Zip Fleece Jacket", item_number: 'LWSP17-105', style_number: 'F223', description: '7.5-ounce, 100% polyester microfleece. Non-zippered front pockets. Open cuffs and hem.')

    @color_1 = @product_6.colors.create(name: 'Black', hex_color: '#000000'  )
      File.open('/Users/jasonamerine/Dittoh/LW Supply Images/black_mens_fleece.jpg') do |f|
        @color_1.color_sample = f
      end
    @color_1.save


    @size_1 = @product_6.sizes.create(name: 'SM', price: 22.00)
    @size_2 = @product_6.sizes.create(name: 'MD', price: 22.00)
    @size_3 = @product_6.sizes.create(name: 'LG', price: 22.00)
    @size_4 = @product_6.sizes.create(name: 'XL', price: 22.00)
    @size_5 = @product_6.sizes.create(name: '2XL', price: 24.00)
    @size_6 = @product_6.sizes.create(name: '3XL', price: 26.50)
    @size_6 = @product_6.sizes.create(name: '4XL', price: 28.00)

################### END PRODUCT ########################


################### START PRODUCT ########################

  @product_7 = @account_1.products.create(name: "Low Profile Twill Cap", item_number: 'LWSP17-107', style_number: 'i5000', description: 'Lightweight brushed cotton twill.  Six panel structured cap. Fabrix strap with two piece Velcro®.')

    @color_1 = @product_7.colors.create(name: 'Black', hex_color: '#000000'  )
      File.open('/Users/jasonamerine/Dittoh/LW Supply Images/black_hat.jpg') do |f|
        @color_1.color_sample = f
      end
    @color_1.save

    @color_2 = @product_7.colors.create(name: 'White', hex_color: '#FFFFFF'  )
      File.open('/Users/jasonamerine/Dittoh/LW Supply Images/hat_white.jpg') do |f|
        @color_2.color_sample = f
      end
    @color_2.save


    @size_1 = @product_7.sizes.create(name: 'One-Size', price: 6.25)



################### END PRODUCT ########################

################### START PRODUCT ########################

  @product_8 = @account_1.products.create(name: "Low Profile Twill Cap", item_number: 'LWSP17-106', style_number: 'USA350', description: 'Brushed cotton/polyester blend. Structured, six-panel, mid-profile.  American flag sandwich visor.  Velcro® Closure with Woven Flag label on back strap. Camo brand woven loop label over back arch')

    @color_1 = @product_8.colors.create(name: 'Mossy Oak', hex_color: '#?????'  )
      File.open('/Users/jasonamerine/Dittoh/LW Supply Images/mossy oak hat.jpg') do |f|
        @color_1.color_sample = f
      end
    @color_1.save

    @size_1 = @product_8.sizes.create(name: 'One-Size', price: 9.00)


################### END PRODUCT ########################

################### START PRODUCT ########################

  @product_9 = @account_1.products.create(name: "Stainless Steel Tumbler with Clear Lid", item_number: 'LWSP17-108', style_number: '5779', description: 'Double wall construction insulation for Hot or Cold liquids. Keeps drinks Hot or Cold up to 6 hours. BPA Free with non-skid rubber bottom. Hand wash recommended. $12.00 each (not for individual sale).')

    @color_1 = @product_9.colors.create(name: 'Stainless Steel', hex_color: '#97999B'  )
      File.open('/Users/jasonamerine/Dittoh/LW Supply Images/tumbler.jpg') do |f|
        @color_1.color_sample = f
      end
    @color_1.save

    @size_1 = @product_9.sizes.create(name: '36 Piece Case', price: 432.00)
    @size_2 = @product_9.sizes.create(name: '72 Piece Case', price: 864.00)


################### END PRODUCT ########################

################### START PRODUCT ########################

  @product_10 = @account_1.products.create(name: "Mini Sharpie", item_number: 'LWSP17-109', style_number: 'N/A', description: 'Red cap with full color logo. $1.50 each (not for individual sale)')

    @color_1 = @product_10.colors.create(name: 'Red', hex_color: '#D21444'  )
      File.open('/Users/jasonamerine/Dittoh/LW Supply Images/sharpie.jpg') do |f|
        @color_1.color_sample = f
      end
    @color_1.save

    @size_1 = @product_10.sizes.create(name: '50 Piece Case', price: 75.00)
    @size_2 = @product_10.sizes.create(name: '75 Piece Case', price: 112.50)
    @size_3 = @product_10.sizes.create(name: '100 Piece Case', price: 150.00)


################### END PRODUCT ########################
