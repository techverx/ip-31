class QuoteCategory < ActiveRecord::Base
  attr_accessible :title
  has_many :quotes
end
