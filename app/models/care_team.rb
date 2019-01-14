class CareTeam < ApplicationRecord
   NUMBER_OF_PERMITTED_TEAMS = 3 #this is the number of added members allowed    
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
   def self.search_state(team_state)
      if team_state
         team_state.downcase!
         self.where('LOWER(team_state) LIKE ?', "%#{team_state}%").order('created_at ASC')
      else
          CareTeam.all.order('created_at ASC')
      end
   end
   def self.search_city(team_city)
      if team_city
         team_city.downcase!
         self.where('LOWER(team_city) LIKE ?', "%#{team_city}%").order('created_at ASC')
      else
          CareTeam.all.order('created_at ASC')
      end
   end
end
