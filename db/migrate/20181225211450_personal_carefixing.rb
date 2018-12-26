class PersonalCarefixing < ActiveRecord::Migration[5.2]
  def change
   add_column :job_posts, :companion_care, :string       
  end
end
