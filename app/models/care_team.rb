class CareTeam < ApplicationRecord
   NUMBER_OF_PERMITTED_TEAMS = 3 #this is the number of added members allowed    
   belongs_to :team, optional: true  
   has_many :teams
   def self.search(team_name)
      if team_name
         team_name.downcase!
         self.where('LOWER(team_name) LIKE ?', "%#{team_name}%").order('created_at ASC')
      else
          CareTeam.all.order('created_at ASC')
      end
   end
end
