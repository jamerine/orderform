class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to company_path(@account), notice: 'Account has been created successfully!'
    else
      redirect_to new_account_path, alert: 'There was an error creating the account'
    end
  end

  def index
    @accounts = Account.all
  end

  def show
    @products = @account.products
  end

  private

  def set_account
    @account = Account.find_by!(subdomain: params[:id])
  end

  def account_params
    params.require(:account).permit(:business_name, :address_line_1, :address_line_2, :address_line_2, :city,
        :state, :zip_code, :country, :website, :phone_number, :phone_number_extension, :fax_number, :email_address, :subdomain
    )
  end

end
