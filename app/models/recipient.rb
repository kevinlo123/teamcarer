class Recipient < ApplicationRecord
   belongs_to :family
   validates :age, numericality: { only_integer: true }   
   # validates :hours_weekly, numericality: { only_integer: true }      
end
