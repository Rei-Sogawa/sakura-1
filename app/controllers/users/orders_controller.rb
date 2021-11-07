class Users::OrdersController < Users::ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = current_user.order
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to [:users, @order], notice: 'Order was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(users_order_params)
      redirect_to [:users, @order], notice: 'Order was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to users_orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params; end
end
