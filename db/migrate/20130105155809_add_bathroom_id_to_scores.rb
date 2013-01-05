class AddBathroomIdToScores < ActiveRecord::Migration
  def change
    add_column :scores, :bathroom_id, :integer
  end
end
