class QuestionToCareGiver < ActiveRecord::Migration[5.2]
  def change
   add_column :care_givers, :who_pays, :string
   add_column :care_givers, :heard_from, :string
  end
end
