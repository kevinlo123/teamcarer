class CareGiverYesNoContinue < ActiveRecord::Migration[5.2]
  def change
   add_column :care_givers, :drugs_alcohol, :boolean  
   add_column :care_givers, :felonies, :boolean
   add_column :care_givers, :years_experience, :string  
   add_column :care_givers, :authorized, :boolean   
  end
end
