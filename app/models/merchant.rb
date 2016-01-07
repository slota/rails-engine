class Merchant < ActiveRecord::Base

  has_many :invoices
  has_many :items

  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices


  def self.random
    order("RANDOM()").first
  end

  def self.most_items(quantity)
    sorted_merchants = all.sort_by do |merchant|
      merchant.total_items
    end
    sorted_merchants.last(quantity)
  end

  def favorite_customer
    Customer.joins(:invoices)
            .joins(:transactions)
            .where("invoices.merchant_id = ? AND transactions.result = 'success'", id)
            .group('id')
            .order('count(invoices.customer_id) DESC')
            .first
  end

  def total_items
    invoices.successful_invoices.joins(:invoice_items).sum(:quantity)
  end

  def revenue(params)
    if params[:date]
      revenue_total = invoices.where('invoices.created_at = ?', params[:date])
                              .successful_invoices
                              .joins(:invoice_items)
                              .sum('invoice_items.quantity * invoice_items.unit_price')
      {'revenue' => revenue_total}
    else
      revenue_total = invoices.joins(:invoice_items)
                              .successful_invoices
                              .sum('invoice_items.quantity * invoice_items.unit_price')
      {'revenue' => revenue_total}
    end
  end

  def self.revenue_by_date(params)
    revenue_total = Invoice.where('invoices.created_at = ?', params)
                            .joins(:invoice_items)
                            .successful_invoices
                            .sum('invoice_items.quantity * invoice_items.unit_price')
    {'total_revenue' => revenue_total}
  end
end
