require 'test_helper'

class Category2sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category2s_index_url
    assert_response :success
  end

  test "should get edit" do
    get category2s_edit_url
    assert_response :success
  end

end
