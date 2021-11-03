class AddIndexToCartItem < ActiveRecord::Migration[6.1]
  def change
    add_index :cart_items, %i[user_id product_id], unique: true
  end
end
