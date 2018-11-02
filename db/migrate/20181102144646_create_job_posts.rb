class CreateJobPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.boolean :taken
      t.references :family, foreign_key: true

      t.timestamps
    end
  end
end
