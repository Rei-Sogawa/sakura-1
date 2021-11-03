class Users::ProductsController < Users::ApplicationController
  before_action :set_users_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users_product
    @product = Product.find(params[:id])
  end
end
