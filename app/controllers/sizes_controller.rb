class SizesController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @size = Size.new
    @sizes = Size.all
  end

  def create
    @product = Product.find(params[:size][:product_id])
    @find_size = Size.find_by(name: params[:size][:name], price: params[:size][:price])
    if @find_size
      @find_product_size = @product.products_sizes.find_by(product_id: @product.id, size_id: @find_size.id)
      if @find_product_size
        @message = "Already Created and assigned"
      else
        @size = ProductsSize.create(product_id: params[:size][:product_id], size_id: @find_size.id)
        @message = "Size Assigned"
      end
    else
      @size = @product.sizes.create(size_params)
      @message = "Size Created and Assigned."
    end
     redirect_to account_product_path(account_id: @product.account_id, id: @product), notice: @message
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
