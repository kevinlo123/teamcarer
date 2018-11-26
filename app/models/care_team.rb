class CareTeam < ApplicationRecord
   # belongs_to :team, optional: true
   has_many :teams 
end
