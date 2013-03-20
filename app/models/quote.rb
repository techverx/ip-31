class Quote < ActiveRecord::Base
  attr_accessible :quote, :quote_by, :quote_category_id
  belongs_to :quote_category
  validates :quote,  :presence => true
  validates :quote_by, :presence => true
end
