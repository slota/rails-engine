require 'csv'
namespace :download do

  task :import, [:filename] => :environment do
    CSV.foreach('./lib/assets/customers.csv', :headers => true) do |row|
      Customer.create(row.to_hash)
    end

    CSV.foreach('./lib/assets/merchants.csv', :headers => true) do |row|
      Merchant.create(row.to_hash)
    end

    CSV.foreach('./lib/assets/invoices.csv', :headers => true) do |row|
      Invoice.create(row.to_hash)
    end

    CSV.foreach('./lib/assets/items.csv', :headers => true) do |row|
      Item.create({
                            :name        => row["name"],
                            :description => row["description"],
                            :unit_price  => row["unit_price"].to_f/100,
                            :created_at  => row["created_at"],
                            :updated_at  => row["updated_at"],
                            :merchant_id => row["merchant_id"]
      })
    end

    CSV.foreach('./lib/assets/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create({
                            :quantity   => row["quantity"],
                            :unit_price => row["unit_price"].to_f/100,
                            :created_at => row["created_at"],
                            :updated_at => row["updated_at"],
                            :item_id    => row["item_id"],
                            :invoice_id => row["invoice_id"]
      })
    end

    CSV.foreach('./lib/assets/transactions.csv', :headers => true) do |row|
      Transaction.create({
                            :id => row["id"],
                            :invoice_id => row["invoice_id"],
                            :credit_card_number => row["credit_card_number"],
                            :result => row["result"],
                            :created_at => row["created_at"],
                            :updated_at => row["updated_at"]
      })
    end
  end
end
