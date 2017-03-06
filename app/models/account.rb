class Account < ApplicationRecord
  has_many :products

  mount_uploader :logo, LogoUploader



end
