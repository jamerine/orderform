class Account < ApplicationRecord


  def to_param
    subdomain
  end


end
