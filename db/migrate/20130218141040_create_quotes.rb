class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :quote
      t.integer :quote_category_id
      t.string :quote_by

      t.timestamps
    end
  end
end
