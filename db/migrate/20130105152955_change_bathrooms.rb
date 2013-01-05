class ChangeBathrooms < ActiveRecord::Migration
  def up
    rename_column :bathrooms, :type, :btype
  end

  def down
    rename_column :bathrooms, :btype, :type
  end
end
