class Fixingjob < ActiveRecord::Migration[5.2]
  def change
   remove_column :job_posts, :companion_care, :string, :array => true       
  end
end
