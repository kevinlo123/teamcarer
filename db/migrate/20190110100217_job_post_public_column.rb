class JobPostPublicColumn < ActiveRecord::Migration[5.2]
  def change
   add_column :job_posts, :public, :boolean, default: false
  end
end
