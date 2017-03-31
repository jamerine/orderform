class ProductLogo < ApplicationRecord
  belongs_to :account

  mount_uploader :product_logo_image, ProductLogoImageUploader


end
