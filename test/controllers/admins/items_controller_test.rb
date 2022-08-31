require "test_helper"

class Admins::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admins_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_items_destroy_url
    assert_response :success
  end
end
