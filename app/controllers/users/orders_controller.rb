class Users::OrdersController < Users::ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = current_user.order
  end

  def show; end

  def new
    @user_info = current_user.user_info || current_user.build_user_info
    @order = current_user.order.build
    @order_products = current_user.cart_item.map do |cart_item|
      @order.order_product.build({ product_id: cart_item.product.id, product_count: cart_item.product_count })
    end
  end

  def edit; end

  def create
    @order = current_user.order.build(order_params)
    @user_info = current_user.build_user_info(user_info_params)

    # if @order.save
    #   redirect_to [:users, @order], notice: 'Order was successfully created.'
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:delivery_time, :delivery_date)
  end

  def user_info_params
    params.require(:order).permit(user_info: %i[first_name])
  end
end
