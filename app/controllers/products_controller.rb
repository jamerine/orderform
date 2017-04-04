class ProductsController < ApplicationController

  def new
    @product = Product.new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    @product = Product.new(product_params)
    @product.assign_attributes(account_id: @account.id)
    if @product.save
      redirect_to @account, notice: "Product has been added to account successfully."
    else
      redirect_to new_account_product_path, alert: "There was an error adding product. Please try again."
    end
  end

  def show
    @product = Product.find(params[:id])
    @account = @product.account
    @new_color = Color.new
    @new_size = Size.new
  end

  def edit
    @account = Account.find(params[:account_id])
    @product = Product.find(params[:id])
  end

  def update
    @account = Account.find(params[:account_id])
    @product = Product.find(params[:id])
    @product.assign_attributes(product_params)
    if @product.save
      redirect_to account_product_path(@product), notice: "Product has been updated"
    else
      redirect_to edit_account_product_path(@product), alert: "There was an error editting product. Please try again."
    end
  end

  def color
    @product = Product.find(params[:product_id])
    @color = Color.find(params[:id])
    @products_color = ProductsColor.find_by(product_id: @product.id, color_id: @color.id)
    if @products_color.destroy
      redirect_to account_product_path(account_id: @product.account_id, id: @product.id), notice: "Color has been removed"
    else
      redirect_to account_product_path(account_id: @product.account_id, id: @product.id), alert: "There was an error removing the color"
    end
  end

  def assign_colors
    @product = Product.find(params[:product_id])
    @color = Color.find(params[:id])
    @products_color = ProductsColor.new(product_id: @product.id, color_id: @color.id)
    if @products_color.save
      redirect_to account_product_path(account_id: @product.account_id, id: @product.id), notice: "Color has been added"
    else
      redirect_to account_product_path(account_id: @product.account_id, id: @product.id), alert: "There was an error adding the color"
    end
  end

  def size
    @product = Product.find(params[:product_id])
    @size = Size.find(params[:id])
    @message = "Payroll was deleted."
    @products_size = ProductsSize.find_by(product_id: @product.id, size_id: @size.id)
    if @products_size.destroy
      redirect_to account_product_path(account_id: @product.account_id, id: @product.id), notice: "Size has been removed"
    else
      redirect_to account_product_path(account_id: @product.account_id, id: @product.id), alert: "There was an error removing the size."
    end
  end

  def assign_sizes
    @product = Product.find(params[:product_id])
    @size = Size.find(params[:id])
    @products_size = ProductsSize.new(product_id: @product.id, size_id: @size.id)
    if @products_size.save
      redirect_to account_product_path(account_id: @product.account_id, id: @product.id), notice: "Size has been added"
    else
      redirect_to account_product_path(account_id: @product.account_id, id: @product.id), alert: "There was an error adding the size"
    end
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :description, :item_number,  :ordering_number, :vendor, :active, :product_page_url, :product_image, :account_id)
  end

end
