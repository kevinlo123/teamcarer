class RemoveFKey < ActiveRecord::Migration[5.2]
  def change
   remove_foreign_key :hours, column: :job_post_id  
  end
end
