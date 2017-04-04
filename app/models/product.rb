class Product < ApplicationRecord
  belongs_to :account
  has_many :products_colors
  has_many :colors, through: :products_colors
  has_many :products_sizes
  has_many :sizes, through: :products_sizes
  has_many :order_items

  default_scope { order(ordering_number: :asc) }


  mount_uploader :product_image, ProductImageUploader

  validates :name, :presence => true
  validates :description, :presence => true
  validates :ordering_number, :presence => true




end
