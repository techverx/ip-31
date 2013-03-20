class AddColumnZipFileToShape < ActiveRecord::Migration
  def change
    add_column :shapes, :zip_file, :string
  end
end
