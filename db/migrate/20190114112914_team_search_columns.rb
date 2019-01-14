class TeamSearchColumns < ActiveRecord::Migration[5.2]
  def change
   add_column :care_teams, :team_state, :string
   add_column :care_teams, :team_city, :string   
  end
end
