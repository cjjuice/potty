class CreateBathrooms < ActiveRecord::Migration
  def change
    create_table :bathrooms do |t|
      t.integer :vid
      t.string :name
      t.string :type
      t.boolean :is_public

      t.timestamps
    end
  end
end
