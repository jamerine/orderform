class ProductLogosController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
    @product_logo = ProductLogo.new
  end

  def create
    @product_logo = ProductLogo.new(account_id: params[:product_logo][:account_id], name: params[:product_logo][:name], product_logo_image: params[:product_logo][:product_logo_image] )
    if @product_logo.save
      redirect_to @product_logo.account, notice: "Product Logo has been created."
    else
      redirect_to @product_logo.account, alert: "Error."
    end
  end

  def destroy
    @product_logo = ProductLogo.find(params[:id])
    if @product_logo.destroy
      redirect_to @product_logo.account, notice: "Product Logo has been deleted"
    else
      redirect_to @product_logo.account, alert: "There has been an issue deleting the product logo"
    end
  end


  private


  def product_logo_params
    params.require(:product_logo).permit(:name, :product_logo_image, :account_id)
  end
end
