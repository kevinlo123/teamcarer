class CareGiverColumns < ActiveRecord::Migration[5.2]
  def change
   add_column :care_givers, :emergency_contact, :string
   add_column :care_givers, :emergency_number, :string   
  end
end
