class CareGiverExperience < ActiveRecord::Migration[5.2]
  def change
      add_column :work_exps, :employer, :string
      add_column :work_exps, :title, :string  
      add_column :educations, :school, :string 
      add_column :educations, :major, :string 
      add_column :certificates, :school_program, :string   
      add_column :certificates, :certificate, :string                  
  end
end
