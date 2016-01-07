class Transaction < ActiveRecord::Base
  belongs_to :invoice

  def self.random
    order("RANDOM()").first
  end

  def self.successful_transactions
    transactions.where(transactions: { result: 'success'} )
  end
end
