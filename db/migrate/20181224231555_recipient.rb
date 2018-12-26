class Recipient < ActiveRecord::Migration[5.2]
  def change
   add_column :recipients, :primary_language, :string
   add_column :recipients, :phone , :string
   add_column :recipients, :address , :string  
   add_column :recipients, :city , :string   
   add_column :recipients, :state, :string  
  end
end
