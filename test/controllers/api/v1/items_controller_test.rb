require "test_helper"

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    items = JSON.parse(response.body)
    first_item = items.first

    assert_response :success
    assert_equal "stark", first_item["name"]
    assert_equal "honorable but dead", first_item["description"]
    assert_equal "99.99", first_item["unit_price"]
    assert_equal 4, items.count
  end

  test "#show" do
    item = Item.first
    get :show, format: :json, id: 1

    assert_response :success
    assert_equal "stark", item["name"]
    assert_equal "honorable but dead", item["description"]
  end

  test "#random" do
    get :random, format: :json

    item = JSON.parse(response.body)

    assert_not_nil(items, faliure_message = nil)
  end

  test "#find" do
    item = Item.first
    get :find, format: :json, id: item.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test "#find all" do
    get :find_all, format: :json
    assert_response :success
    assert_kind_of Array, json_response
  end
end
