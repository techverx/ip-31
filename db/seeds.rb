# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

2.times do |i|
  Background.create([{:name => "BG-0#{i.to_s}", :product_code => "PC-0#{i.to_s}", :product_identifier => "PC-ID-0#{i.to_s}", :iap_price_id => 1, :active_yn => true, :image =>''}])
end
#
#10.times do |i|
#  Font.create([{:name => "FONT-00#{i.to_s}", :product_code => "PC-00#{i.to_s}", :product_identifier => "PC-ID-00#{i.to_s}", :iap_price_id => 0.99, :image =>''}])
#end

  QuoteCategory.create([{:title => "Age"}])
  QuoteCategory.create([{:title => "Love"}])
  QuoteCategory.create([{:title => "Lie"}])
  QuoteCategory.create([{:title => "Family"}])

  IapPrice.create([{:description => "$ 0.99"}])
  IapPrice.create([{:description => "$ 1.99"}])
  IapPrice.create([{:description => "$ 2.99"}])
  IapPrice.create([{:description => "$ 3.99"}])

