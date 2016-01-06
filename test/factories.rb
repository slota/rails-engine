FactoryGirl.define do
  factory :customer do
    first_name "John"
    last_name  "Doe"
  end

  factory :invoice_items do
    quantity "999"
    unit_price  "999"
    item_id "939"
    invoice_id "1969"
    item
    invoice
  end

  factory :invoices do
    status "paid"
    customer
    merchant
  end

  factory :items do
    name "awesome name"
    description  "awesome description"
    unit_price 10
    merchant
  end

  factory :merchants do
    name "awesome name"
  end

  factory :transactions do
    credit_card_number "1234567891234"
    result "awesome result"
    invoice
  end
end
