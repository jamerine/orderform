class ColorsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @color = Color.new
    @colors = Color.all
  end

  def create
    @product = Product.find(params[:color][:product_id])
    @color = @product.colors.create(color_params)
    redirect_to account_product_path(account_id: @product.account_id, id: @product), notice: "Size has been created."
  end

    def destroy
      @products_colors = ProductsColor.where(color_id: params[:id])
      @products_colors.destroy_all
      @color = Color.find(params[:id])
      if @color.destroy
        redirect_to new_color_path(product_id: params[:product_id]), notice: "Color has been deleted"
      else
        redirect_to new_color_path(product_id: params[:product_id]), notice: "There has been an issue deleting the color"
      end
    end


  private


  def color_params
    params.require(:color).permit(:name, :hex_color, :color_sample)
  end
end
