require "test_helper"

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    transactions = JSON.parse(response.body)
    first_transaction = transactions.first

    assert_response :success
    assert_equal "345", first_transaction["credit_card_number"]
    assert_equal "pretty sweet", first_transaction["result"]
    assert_equal 2, transactions.count
  end

  test "#show" do
    transaction = Transaction.last
    get :show, format: :json, id: 1

    assert_response :success
    assert_equal "345", transaction["credit_card_number"]
    assert_equal "pretty sweet", transaction["result"]
  end

  test "#random" do
    get :random, format: :json

    transaction = JSON.parse(response.body)

    assert_not_nil(transactions, faliure_message = nil)
  end

  test "#find" do
    transaction = Transaction.first
    get :find, format: :json, id: transaction.id

    assert_response :success
    assert_kind_of Hash, json_response
  end

  test "#find all" do
    get :find_all, format: :json
    assert_response :success
    assert_kind_of Array, json_response
  end
end
