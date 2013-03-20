class AddColumnZipFileToBackground < ActiveRecord::Migration
  def change
    add_column :backgrounds, :zip_file, :string
  end
end
