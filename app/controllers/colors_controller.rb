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


  def create
    @product = Product.find(params[:color][:product_id])
    @find_color = Color.find_by(name: params[:color][:name])
    if @find_color
      @find_product_color = @product.products_colors.find_by(product_id: @product.id, color_id: @find_color.id)
      if @find_product_color
        @message = "Already Created and assigned"
      else
        @color = ProductsColor.create(product_id: params[:color][:product_id], color_id: @find_color.id)
        @message = "Color Assigned"
      end
    else
      @color = @product.colors.create(color_params)
      @message = "Color Created and Assigned."
    end
     redirect_to account_product_path(account_id: @product.account_id, id: @product)
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
