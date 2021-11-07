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

  def self.sub_total(cart_items)
    cart_items.inject(0) { |sum, cart_item| sum + cart_item.product_count * cart_item.product.price }
  end

  def self.cash_on_delivery(cart_items)
    case sub_total(cart_items)
    when 0..9_999
      300
    when 10_000..29_999
      400
    when 30_000..100_000
      600
    when 100_000..nil
      1000
    end
  end

  def self.postage(cart_items)
    600 + 600 * (cart_items.inject(0) { |sum, v| sum + v.product_count } / 5)
  end

  def self.total(cart_items)
    without_tax = sub_total(cart_items) + cash_on_delivery(cart_items) + postage(cart_items)
    (without_tax * 1.1).to_i
  end
end
