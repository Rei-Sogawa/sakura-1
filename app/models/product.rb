class Product < ApplicationRecord
  has_many :cart_item
  has_many :order_product
end
