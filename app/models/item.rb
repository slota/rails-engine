class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  default_scope -> { order('id DESC') }

  def self.random
    order("RANDOM()").first
  end
end
