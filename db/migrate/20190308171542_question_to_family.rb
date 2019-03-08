class QuestionToFamily < ActiveRecord::Migration[5.2]
  def change
   add_column :families, :who_pays, :string
   add_column :families, :heard_from, :string
   add_column :educations, :degree, :string
   add_column :recipients, :apt_suit, :string
  end
end
