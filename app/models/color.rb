class Color < ApplicationRecord
  has_many :products_colors
  has_many :products, through: :products_colors

end
