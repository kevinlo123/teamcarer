class AddPhoneToFamilies < ActiveRecord::Migration[5.2]
  def change
   add_column :families, :phone , :string
  end
end
