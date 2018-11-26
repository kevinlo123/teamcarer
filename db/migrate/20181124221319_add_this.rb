class AddThis < ActiveRecord::Migration[5.2]
  def change
   create_table :care_teams do |t|
      t.string :team_name
      t.string :team_statement
 
      t.timestamps
    end
  end
end
