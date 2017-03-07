class Account < ApplicationRecord
  has_many :products
  has_many :orders

  mount_uploader :logo, LogoUploader



end
