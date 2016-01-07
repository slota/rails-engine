require "test_helper"

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#index" do

    get :index, format: :json

    invoices = JSON.parse(response.body)
    first_invoice = invoices.first


    assert_response :success
    assert_equal "kewl", first_invoice["status"]
    assert_equal 3, invoices.count
  end

  test "#show" do
    invoice = Invoice.first
    get :show, format: :json, id: 1

    assert_response :success
    assert_equal "american", invoice["status"]
  end

  test "#random" do
    get :random, format: :json

    invoice = JSON.parse(response.body)

    assert_not_nil(invoice, failure_message = nil)
  end

  test "#find" do
    invoice = Invoice.first
    get :find, format: :json, id: invoice.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test "#find all" do
    get :find_all, format: :json
    assert_response :success
    assert_kind_of Array, json_response
  end
end
