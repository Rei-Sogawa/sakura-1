require "test_helper"

class Users::CartItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_cart_item = users_cart_items(:one)
  end

  test "should get index" do
    get users_cart_items_url
    assert_response :success
  end

  test "should get new" do
    get new_users_cart_item_url
    assert_response :success
  end

  test "should create users_cart_item" do
    assert_difference('Users::CartItem.count') do
      post users_cart_items_url, params: { users_cart_item: {  } }
    end

    assert_redirected_to users_cart_item_url(Users::CartItem.last)
  end

  test "should show users_cart_item" do
    get users_cart_item_url(@users_cart_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_cart_item_url(@users_cart_item)
    assert_response :success
  end

  test "should update users_cart_item" do
    patch users_cart_item_url(@users_cart_item), params: { users_cart_item: {  } }
    assert_redirected_to users_cart_item_url(@users_cart_item)
  end

  test "should destroy users_cart_item" do
    assert_difference('Users::CartItem.count', -1) do
      delete users_cart_item_url(@users_cart_item)
    end

    assert_redirected_to users_cart_items_url
  end
end
