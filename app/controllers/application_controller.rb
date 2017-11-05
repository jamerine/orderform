class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_account_favicon


  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_account_favicon
    if !session[:account_id].nil?
      account = Account.find(session[:account_id])
      if account.favicon_image_url.nil?
        'shopping-cart-favicon.jpg'
      else
        account.favicon_image_url
      end
    else
      'shopping-cart-favicon.jpg'
    end
  end
end
