class PriceColumns < ActiveRecord::Migration[5.2]
   def change
      add_column :care_teams, :companion_hrly_price, :integer
      add_column :care_teams, :personal_hrly_price, :integer       
   end
end
