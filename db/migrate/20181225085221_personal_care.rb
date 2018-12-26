class PersonalCare < ActiveRecord::Migration[5.2]
  def change
   add_column :recipients, :personal_care, :string, :array => true 
   add_column :recipients, :mobility, :string, :array => true
   add_column :recipients, :conditions, :string, :array => true    
  end
end
