class Font < ActiveRecord::Base
  attr_accessible :iap_price_id, :image, :name, :product_code, :product_identifier
  validates :name, :uniqueness => true, :presence => true
  validates :product_code, :uniqueness => true, :presence => true
  validates :product_identifier, :presence => true
  belongs_to :iap_price
  mount_uploader :image, FontUploader
  
end
