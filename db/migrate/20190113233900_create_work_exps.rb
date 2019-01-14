class CreateWorkExps < ActiveRecord::Migration[5.2]
  def change
    create_table :work_exps do |t|

      t.timestamps
    end
  end
end
