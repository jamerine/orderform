class SizesController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @size = Size.new
    @sizes = Size.all
  end

  def create
    @product = Product.find(params[:size][:product_id])
    @size = @product.sizes.create(size_params)
    redirect_to account_product_path(account_id: @product.account_id, id: @product)
  end



  private


  def size_params
    params.require(:size).permit(:name, :price)
  end


end
