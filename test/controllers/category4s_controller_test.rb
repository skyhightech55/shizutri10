require 'test_helper'

class Category4sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category4s_index_url
    assert_response :success
  end

  test "should get edit" do
    get category4s_edit_url
    assert_response :success
  end

end
