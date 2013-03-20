class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
      t.string :name
      t.string :product_code
      t.string :product_identifier
      t.decimal :iap_price_id

      t.timestamps
    end
  end
end
