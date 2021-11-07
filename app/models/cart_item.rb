class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :id, uniqueness: { scope: %i[user_id product_id] }
  validates :product_count, numericality: { only_integer: true, greater_than: 0 }

  default_scope -> { order(created_at: :desc) }

  def increment
    self.product_count += 1
    self
  end

  def decrement
    self.product_count -= 1 if self.product_count > 1
    self
  end
end
