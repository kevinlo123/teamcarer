class CareTeam < ApplicationRecord
   NUMBER_OF_PERMITTED_TEAMS = 4 #this is the number of added members allowed    
   belongs_to :care_giver, optional: true  
   has_many :care_givers

   def self.search(team_name)
      if team_name
         team_name.downcase!
         self.where('LOWER(team_name) LIKE ?', "%#{team_name}%").order('created_at ASC')
      else
          CareTeam.all.order('created_at ASC')
      end
   end

   def self.search_both(team_city, team_state)
      team_city.downcase!
      team_state.downcase!
      self.where('LOWER(team_city) = ? AND LOWER(team_state) = ?', team_city, team_state).order('created_at ASC')
   end
end
