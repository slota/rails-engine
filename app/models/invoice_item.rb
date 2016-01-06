class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item
  default_scope -> { order('id DESC') }


  def self.random
    order("RANDOM()").first
  end
end
