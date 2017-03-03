class Account < ApplicationRecord
  has_many :products

  def to_param
    subdomain
  end


end
