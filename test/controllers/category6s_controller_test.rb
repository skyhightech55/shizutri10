require 'test_helper'

class Category6sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category6s_index_url
    assert_response :success
  end

  test "should get edit" do
    get category6s_edit_url
    assert_response :success
  end

end
