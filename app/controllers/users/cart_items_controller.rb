class Users::CartItemsController < Users::ApplicationController
  before_action :set_cart_item, only: %i[update destroy]

  def index
    @cart_items = current_user.cart_item
  end

  def create
    @cart_item = current_user.cart_item.build(cart_item_params)

    if @cart_item.save
      redirect_to users_cart_items_url, notice: 'Cart item was successfully created.'
    else
      render [:users, @cart_item.product]
    end
  end

  def update
    if params[:increment]
      @cart_item.increment
    elsif params[:decrement]
      @cart_item.decrement
    end

    if @cart_item.save
      redirect_to users_cart_items_url
    else
      render :index
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to users_cart_items_url, notice: 'Cart item was successfully destroyed.'
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :product_count)
  end
end
