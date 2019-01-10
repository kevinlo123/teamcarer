class JobPostTableColumns < ActiveRecord::Migration[5.2]
   def change
      add_column :job_posts, :recipient_gender, :string
      add_column :job_posts, :location, :string
      add_column :job_posts, :recipient_quality, :string      
      add_column :job_posts, :family_contact, :string                               
   end
end
