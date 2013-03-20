class Background < ActiveRecord::Base
  #before_save :finalimgage
  attr_accessible :name, :product_code, :product_identifier, :iap_price_id, :active_yn, :image, :image2, :image3, :zip_file
  belongs_to :iap_price
  #accepts_nested_attributes_for :assets, :allow_destroy =>true
  validates :name, :uniqueness => true, :presence => true
  validates :product_code, :uniqueness => true, :presence => true
  validates :product_identifier, :presence => true
  mount_uploader :image, BackgroundUploader
  mount_uploader :image2, BackgroundUploader
  mount_uploader :image3, BackgroundUploader
  mount_uploader :zip_file, ZipUploader


  def finalimgage
    #puts "-----------#{img1.path}****#{img2.path}------------ss"
    # self.image=self.img1
    one = ::Magick::Image::read(img1.path).first
    two = ::Magick::Image::read(img2.path).first
    three = ::Magick::Image::read(img3.path).first
    #two.composite!(one, 100, 100, ::Magick::OverCompositeOp)
    #three.composite!(two, 50, 50, ::Magick::OverCompositeOp)
    #three.write('composite.png')
    self.image = one.add_compose_mask(two)

  end

end
