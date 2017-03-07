class Color < ApplicationRecord
  has_many :products_colors
  has_many :products, through: :products_colors
  has_many :order_items

  mount_uploader :color_sample, ColorSampleUploader
end
