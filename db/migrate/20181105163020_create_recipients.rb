class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.integer :age
      t.integer :user_id

      t.timestamps
    end
    add_index :recipients, :user_id
  end
end
