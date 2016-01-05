class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  def self.random
    order("RANDOM()").first
  end
end
