class AddingTeamIdAgain < ActiveRecord::Migration[5.2]
  def change
   add_column :care_teams, :team_id, :integer      
  end
end
