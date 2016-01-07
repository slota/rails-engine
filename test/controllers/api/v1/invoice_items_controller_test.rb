require "test_helper"

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    invoice_items = JSON.parse(response.body)
    first_invoice_item = invoice_items.first

    assert_response :success
    assert_equal 100, first_invoice_item["quantity"]
    assert_equal "666.66", first_invoice_item["unit_price"]
    assert_equal 2, invoice_items.count
  end

  test "#show" do
    invoice_item = InvoiceItem.first
    get :show, format: :json, id: 1

    assert_response :success
    assert_equal 100, invoice_item["quantity"]
  end

  test "#random" do
    get :random, format: :json

    invoice_item = JSON.parse(response.body)

    assert_not_nil(invoice_items, faliure_message = nil)
  end

  test "#find" do
     invoice_item = InvoiceItem.first
     get :find, format: :json, id: invoice_item.id

     assert_response :success
     assert_kind_of Hash, json_response
   end

   test "#find all" do
     get :find_all, format: :json
     assert_response :success
     assert_kind_of Array, json_response
   end
end
