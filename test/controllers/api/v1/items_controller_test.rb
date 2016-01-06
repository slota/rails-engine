require "test_helper"

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index returns full items data" do
    get :index, format: :json

    assert_response :success
  end
end
