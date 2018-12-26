class FamiliesSetup < ActiveRecord::Migration[5.2]
  def change
   add_column :families, :street, :string
   add_column :families, :zip, :string
   add_column :families, :state, :string
   add_column :families, :emergency_name, :string   
   add_column :families, :emergency_contact, :string    
   add_column :families, :recipient_relation, :string         
  end
end
