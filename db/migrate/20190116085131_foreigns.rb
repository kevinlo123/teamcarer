class Foreigns < ActiveRecord::Migration[5.2]
  def change
   add_reference :care_teams, :family, foreign_key: true 
   add_reference :families, :care_team, foreign_key: true         
  end
end
