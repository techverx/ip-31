class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :name
      t.string :product_code
      t.string :product_identifier
      t.decimal :iap_price_id
      t.boolean :active_yn
      t.string :image1
      t.string :image2
      t.string :image3

      t.timestamps
    end
  end
end
