class AddParamsToFamily < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :firstname, :string      
  end
end
