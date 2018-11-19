class UpdateTeamsDb < ActiveRecord::Migration[5.2]
  def change
      add_column :teams, :firstname, :string    
      add_column :teams, :middlename, :string 
      add_column :teams, :lastname, :string   
      add_column :teams, :phone, :string    
      add_column :teams, :city, :string
      add_column :teams, :state, :string  
      add_column :teams, :street, :string
      add_column :teams, :zip, :string                    
  end
end
