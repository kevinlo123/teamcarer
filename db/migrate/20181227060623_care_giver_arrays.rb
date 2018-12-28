class CareGiverArrays < ActiveRecord::Migration[5.2]
  def change
   add_column :care_givers, :companion_care, :string, :array => true 
   add_column :care_givers, :personal_care, :string, :array => true  
   add_column :care_givers, :languages, :string, :array => true  
   add_column :care_givers, :conditions, :string, :array => true 
   add_column :care_givers, :related_service, :string, :array => true                
  end
end
