class AddActiveYnToBackground < ActiveRecord::Migration
  def change
    add_column :backgrounds, :active_yn, :boolean
  end
end
