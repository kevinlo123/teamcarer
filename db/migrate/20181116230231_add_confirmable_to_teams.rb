class AddConfirmableToTeams < ActiveRecord::Migration[5.2]
   # Note: You can't use change, as Team.update_all will fail in the down migration
   def up
      add_column :teams, :confirmation_token, :string
      add_column :teams, :confirmed_at, :datetime
      add_column :teams, :confirmation_sent_at, :datetime
      # add_column :families, :unconfirmed_email, :string
      add_index :teams, :confirmation_token, unique: true
      # Family.reset_column_information # Need for some types of updates, but not for update_all
      # To avoid a short time window between running the migration and updating all existing
      # users as confirmed, do the following
      Team.update_all confirmed_at: DateTime.now
      # All existing user accounts should be able to log in after this.
   end

   def down
      remove_columns :teams, :confirmation_token, :confirmed_at, :confirmation_sent_at
      # remove_columns :teams, :unconfirmed_email 
   end
end
