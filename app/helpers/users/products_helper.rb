module Users::ProductsHelper
  def in_cart?
    current_user.cart_item.map{ |v| v.product }.include?(@product)
  end
end
