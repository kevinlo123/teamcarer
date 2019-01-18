class ColumnLeader < ActiveRecord::Migration[5.2]
  def change
   add_column :care_givers, :leader, :boolean, default: false
   
  end
end
