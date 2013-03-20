class AddColumnActiveYnToFont < ActiveRecord::Migration
  def change
    add_column :fonts, :active_yn, :boolean
  end
end
