class ProductsController < ApplicationController

  def new
    @product = Product.new
    @account = Account.find_by!(subdomain: params[:account_id])
  end

  def create
    @account = Account.find_by!(subdomain: params[:account_id])
    @product = Product.new(product_params)
    @product.assign_attributes(account_id: @account.id)
    if @product.save
      redirect_to @account, notice: "Product has been added to account successfully."
    else
      redirect_to new_product_path, alert: "There was an error adding product. Please try again."
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :product_number, :active, :product_page_url)
  end

end
