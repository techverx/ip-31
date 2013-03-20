class CreateQuoteCategories < ActiveRecord::Migration
  def change
    create_table :quote_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
