require 'test_helper'

class WaffleControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_waffle_url
    assert_response :success
  end

  test "should create" do
    post waffles_url, params: { waffle: { name: "gofr dobry bardzo mmm", price: 5.5  } }
    assert_response :found
  end

end
