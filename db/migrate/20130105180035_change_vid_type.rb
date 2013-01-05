class ChangeVidType < ActiveRecord::Migration
  def up
    change_column :bathrooms, :vid, :string
  end

  def down
    change_column :bathrooms, :vid, :integer
  end
end
