class ColumnsExp < ActiveRecord::Migration[5.2]
  def change
   add_column :work_exps, :city, :string
   add_column :work_exps, :state, :string  
   add_column :work_exps, :from, :integer
   add_column :work_exps, :to, :integer   
   add_column :educations, :city, :string 
   add_column :educations, :state, :string 
   add_column :educations,  :from, :integer 
   add_column :educations,  :to, :integer           
   add_column :certificates, :certificatid, :string
   add_column :certificates, :state, :string
   add_column :certificates, :from, :integer 
   add_column :certificates, :to, :integer    
  end
end
