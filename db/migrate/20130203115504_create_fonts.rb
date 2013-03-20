class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.string :name
      t.string :product_code
      t.string :product_identifier
      t.decimal :iap_price_id
      t.string :image

      t.timestamps
    end
  end
end
