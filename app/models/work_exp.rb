class WorkExp < ApplicationRecord
   belongs_to :care_giver 
   attr_accessor :work_exps_attributes
end
