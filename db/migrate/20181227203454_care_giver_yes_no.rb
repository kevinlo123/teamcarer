class CareGiverYesNo < ActiveRecord::Migration[5.2]
  def change
   add_column :care_givers, :dependable_car, :boolean  
   add_column :care_givers, :physical_issues, :boolean   
   add_column :care_givers, :tb_malaria, :boolean 
   add_column :care_givers, :smoke, :boolean 
   add_column :care_givers, :smoke_several_hours, :boolean        
  end
end
