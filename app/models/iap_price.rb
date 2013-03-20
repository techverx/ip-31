class IapPrice < ActiveRecord::Base

  attr_accessible :description, :iap_price
  has_many :backgrounds
  has_many :quotes
  has_many :shapes

end
