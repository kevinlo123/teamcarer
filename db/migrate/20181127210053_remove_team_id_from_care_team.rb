class RemoveTeamIdFromCareTeam < ActiveRecord::Migration[5.2]
  def change
   remove_column :care_teams, :team_id, :integer
  end
end
