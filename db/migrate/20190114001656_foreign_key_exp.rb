class ForeignKeyExp < ActiveRecord::Migration[5.2]
  def change
      add_column :work_exps, :care_giver_id, :integer
      add_column :educations, :care_giver_id, :integer  
      add_column :certificates, :care_giver_id, :integer        
  end
end
