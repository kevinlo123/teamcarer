class CareGiver < ApplicationRecord
   devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable, :confirmable 
   validates_presence_of :phone, :city, :state, :street, :zip, presence: true, on: :create
   belongs_to :care_team, optional: true 
   validate :validate_care_team_user_limit
   private
      def validate_care_team_user_limit
         if care_team_id
            care_team = CareTeam.find_by(id: care_team_id)
            if care_team && care_team.care_givers.count > CareTeam::NUMBER_OF_PERMITTED_TEAMS
               errors.add(:care_team_id, "User cannot be added to that care team")
            end
         end
      end
end
