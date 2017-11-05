class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy, :order_form]

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to account_path(@account), notice: 'Account has been created successfully!'
    else
      redirect_to new_account_path, alert: 'There was an error creating the account'
    end
  end

  def index
    @accounts = Account.all
    session[:account_id] = nil
  end

  def show
    @products = @account.products.order(:ordering_number)
    @product_logos = @account.product_logos
  end

  def edit
  end


  def update
    @account.assign_attributes(account_params)
    if @account.save
      redirect_to account_path(@account), notice: 'Account has been updated successfully!'
    else
      redirect_to edit_account_path(@account), alert: 'There was an issue updating this account. Please try again!'
    end
  end


  def order_form
    @products = @account.products.order(:ordering_number)
    @order_items = current_order.order_items
  end

  def destroy
    if @account.destroy
      redirect_to accounts_path, notice: 'Account deleted successfully.'
    else
      redirect_to @account, alert: 'There was an issue deleting the account.'
    end
  end

  def inactive_landing
    @account = Account.find(params[:account_id])
  end

  private

  def set_account
    @account = Account.find(params[:id])
    session[:account_id] = @account.id
  end

  def account_params
    params.require(:account).permit(:business_name, :contact_first_name, :contact_last_name, :address_line_1, :address_line_2, :address_line_2, :city,
        :state, :zip_code, :country, :website, :phone_number, :phone_number_extension, :fax_number, :email_address, :subdomain, :logo, :order_form_subheading, :orders_due_by, :order_special_message, :active, :favicon_image, :require_pc_id_number
    )
  end

end
