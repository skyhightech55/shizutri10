require 'test_helper'

class Category3sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category3s_index_url
    assert_response :success
  end

  test "should get edit" do
    get category3s_edit_url
    assert_response :success
  end

end
