class CareGiverStatement < ActiveRecord::Migration[5.2]
  def change
   add_column :care_givers, :statement, :text      
  end
end
