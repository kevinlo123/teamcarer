class AddFamilyIdToRecipient < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipients, :family, foreign_key: true
  end
end
