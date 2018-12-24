class AddConfirmableToCareGiver < ActiveRecord::Migration[5.2]
  def change
   add_column :care_givers, :confirmation_token, :string
   add_column :care_givers, :confirmed_at, :datetime
   add_column :care_givers, :confirmation_sent_at, :datetime
   add_column :care_givers, :firstname, :string
   add_column :care_givers, :middlename, :string
   add_column :care_givers, :lastname, :string
   add_column :care_givers, :phone, :string   
   add_column :care_givers, :city, :string   
   add_column :care_givers, :state, :string   
   add_column :care_givers, :street, :string   
   add_column :care_givers, :zip, :string  
   add_column :care_givers, :care_team_id, :integer     
   add_index :care_givers, :confirmation_token, unique: true
 end
end
