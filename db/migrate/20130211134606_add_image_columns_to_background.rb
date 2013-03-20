class AddImageColumnsToBackground < ActiveRecord::Migration
  def change
    add_column :backgrounds, :image2, :string
    add_column :backgrounds, :image3, :string
  end
end
