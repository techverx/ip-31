class Shape < ActiveRecord::Base
  attr_accessible :name, :product_code, :product_identifier, :active_yn, :iap_price_id,:image1_cache,:image2_cache,:image3_cache
  attr_accessible :image1, :image2, :image3,:zip_file
  validates :name, :uniqueness => true, :presence => true
  validates :product_code, :uniqueness => true, :presence => true
  validates :product_identifier, :presence => true
  belongs_to :iap_price
  mount_uploader :image1, ShapeUploader
  mount_uploader :image2, ShapeUploader
  mount_uploader :image3, ShapeUploader
  mount_uploader :zip_file, ZipUploader
end
