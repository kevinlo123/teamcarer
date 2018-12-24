class Add < ActiveRecord::Migration[5.2]
  def change
   add_column :care_teams, :care_giver_id, :integer 
   add_index :care_teams,:care_giver_id
  end
end
