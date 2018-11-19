class AddparamsToFamily < ActiveRecord::Migration[5.2]
  def change
      add_column :families, :middlename, :string 
      add_column :families, :lastname, :string            
  end
end
