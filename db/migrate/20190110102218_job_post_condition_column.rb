class JobPostConditionColumn < ActiveRecord::Migration[5.2]
   def change
      add_column :job_posts, :recipient_conditions, :string                                  
   end
end
