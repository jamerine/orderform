class ColorsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @color = Color.new
    @colors = Color.all
  end

  def create
    @product = Product.find(params[:color][:product_id])
    @color = @product.colors.create(color_params)
    redirect_to account_product_path(account_id: @product.account_id, id: @product)
  end



  private


  def color_params
    params.require(:color).permit(:name, :hex_color, :color_sample)
  end

end
