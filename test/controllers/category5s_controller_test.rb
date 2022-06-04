require 'test_helper'

class Category5sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category5s_index_url
    assert_response :success
  end

  test "should get edit" do
    get category5s_edit_url
    assert_response :success
  end

end
