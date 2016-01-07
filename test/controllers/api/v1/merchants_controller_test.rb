require "test_helper"

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    merchants = JSON.parse(response.body)
    first_merchant = merchants.first

    assert_response :success
    assert_equal "stark", first_merchant["name"]
    assert_equal 2, merchants.count
  end

  test "#show" do
    merchant = Item.first
    get :show, format: :json, id: 1

    assert_response :success
    assert_equal "stark", merchant["name"]
  end

  test "#random" do
    get :random, format: :json

    merchant = JSON.parse(response.body)

    assert_not_nil(merchants, faliure_message = nil)
  end

  test "#find" do
    merchant = Merchant.first
    get :find, format: :json, id: merchant.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test "#find all" do
    get :find_all, format: :json
    assert_response :success
    assert_kind_of Array, json_response
  end
end
