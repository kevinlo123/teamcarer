class JobPostColumnUpdate < ActiveRecord::Migration[5.2]
  def change
   rename_column :job_posts, :location, :city
   add_column :job_posts, :state, :string
  end
end
