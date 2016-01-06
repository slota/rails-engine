require "test_helper"

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    customers = JSON.parse(response.body)
    first_customer = customers.first

    assert_response :success
    assert_equal "ned", first_customer["first_name"]
    assert_equal "stark", first_customer["last_name"]
    assert_equal 4, customers.count
  end

  test "#show" do
    customer = Customer.last
    get :show, format: :json, id: 1

    assert_response :success
    assert_equal "jesus", customer["first_name"]
    assert_equal "christ", customer["last_name"]
  end

  test "#random" do
    get :random, format: :json

    customer = JSON.parse(response.body)

    assert_not_nil(customers, faliure_message = nil)
  end
end
