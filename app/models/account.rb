class Account < ApplicationRecord
  has_many :products
  has_many :orders
  has_many :product_logos
  
  mount_uploader :logo, LogoUploader



end
