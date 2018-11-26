class AddCityToFamily < ActiveRecord::Migration[5.2]
  def change
   add_column :families, :city, :string
  end
end
