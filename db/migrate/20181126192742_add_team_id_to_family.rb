class AddTeamIdToFamily < ActiveRecord::Migration[5.2]
  def change
   remove_column :teams, :care_team_id, :integer
  end
end
