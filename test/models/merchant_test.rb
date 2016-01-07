require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  def setup
    @merchant     = Merchant.create(name: "Slota")
    @customer     = Customer.create(first_name: "Marlo", last_name: "Awesome")
    @invoice      = @merchant.invoices.create(status: "chill", customer_id: @customer.id, merchant_id: @merchant.id)
    @item         = @merchant.items.create(name: "item name", description: "way chill description", unit_price: 1, merchant_id: @merchant.id)
    @invoice_item = @item.invoice_items.create(quantity: 2, unit_price: 1, item_id: @item.id, invoice_id: @invoice.id)
    transaction   = @invoice.transactions.create!(invoice_id: @invoice.id, result: "success")
  end

  test "valid" do
    assert @merchant.valid?
  end

  test "most_items" do
    total = Merchant.most_items(1)

    assert total.present?
  end

  test "favorite_customer" do
    favorite = @merchant.favorite_customer

    assert_equal favorite, @customer
   end

   test "invoice" do
     invoice = @merchant.invoices

     assert invoice.present?
    end

    test "revenue" do
      revenue = Merchant.all.revenue_by_date("2012-03-23 02:58:15 UTC")

      assert revenue.present?
    end
end
