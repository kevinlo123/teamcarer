class DropTableConnection < ActiveRecord::Migration[5.2]
  def change
   drop_table :job_connections
  end
end
