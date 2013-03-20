class CreateIapPrices < ActiveRecord::Migration
  def change
    create_table :iap_prices do |t|
      t.string :description
      t.decimal :iap_price

      t.timestamps
    end
  end
end
