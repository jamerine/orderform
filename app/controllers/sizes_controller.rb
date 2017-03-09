class SizesController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @size = Size.new
    @sizes = Size.all
  end

  def create
    @product = Product.find(params[:size][:product_id])
    @size = @product.sizes.create(size_params)
    redirect_to account_product_path(account_id: @product.account_id, id: @product), notice: "Size has been created"
  end



  def destroy
    @products_sizes = ProductsSize.where(size_id: params[:id])
    @products_sizes.destroy_all
    @size = Size.find(params[:id])
    if @size.destroy
      redirect_to new_size_path(product_id: params[:product_id]), notice: "Size has been deleted"
    else  
      redirect_to new_size_path(product_id: params[:product_id]), notice: "There has been an issue deleting the size"
    end
  end



  private


  def size_params
    params.require(:size).permit(:name, :price)
  end


end
