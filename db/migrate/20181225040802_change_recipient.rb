class ChangeRecipient < ActiveRecord::Migration[5.2]
  def change
   add_column :recipients, :companion_care, :string, :array => true
  end
end
