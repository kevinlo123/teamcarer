class HoursTable < ActiveRecord::Migration[5.2]
   def change
      add_reference :hours, :care_giver, foreign_key: true 
      add_reference :hours, :job_post, foreign_key: true  
      add_column :hours, :companion_hours, :integer
      add_column :hours, :personal_hours, :integer      
      add_column :hours, :day_worked, :date        
   end
end
