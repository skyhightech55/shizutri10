require 'test_helper'

class Category7sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category7s_index_url
    assert_response :success
  end

  test "should get edit" do
    get category7s_edit_url
    assert_response :success
  end

end
