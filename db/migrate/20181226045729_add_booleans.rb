class AddBooleans < ActiveRecord::Migration[5.2]
  def change
   add_column :recipients, :recently_discharged, :boolean
   add_column :recipients, :hospice, :boolean
   add_column :recipients, :hours_weekly, :integer     
   add_column :recipients, :months, :integer                     
  end
end
