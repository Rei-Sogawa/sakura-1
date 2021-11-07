require "test_helper"

class Users::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_order = users_orders(:one)
  end

  test "should get index" do
    get users_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_users_order_url
    assert_response :success
  end

  test "should create users_order" do
    assert_difference('Users::Order.count') do
      post users_orders_url, params: { users_order: {  } }
    end

    assert_redirected_to users_order_url(Users::Order.last)
  end

  test "should show users_order" do
    get users_order_url(@users_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_order_url(@users_order)
    assert_response :success
  end

  test "should update users_order" do
    patch users_order_url(@users_order), params: { users_order: {  } }
    assert_redirected_to users_order_url(@users_order)
  end

  test "should destroy users_order" do
    assert_difference('Users::Order.count', -1) do
      delete users_order_url(@users_order)
    end

    assert_redirected_to users_orders_url
  end
end
