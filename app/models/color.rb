class Color < ApplicationRecord
  has_many :products_colors
  has_many :colors, through: :products_colors

end
