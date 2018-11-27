class CareTeam < ApplicationRecord
   NUMBER_OF_PERMITTED_TEAMS = 3 #this is the number of added members allowed    
   belongs_to :team, optional: true  
   has_many :teams
end
