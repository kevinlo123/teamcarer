class RemoveUnconfirmedEmail < ActiveRecord::Migration[5.2]
   def change
      remove_column :families, :unconfirmed_email, :string
   end
end
