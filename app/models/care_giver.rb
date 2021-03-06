class CareGiver < ApplicationRecord
   devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable, :confirmable 
   validates_presence_of :phone, :city, :state, :street, :zip, presence: true, on: :create
   belongs_to :care_team, optional: true 
   validate :validate_care_team_user_limit
   has_many :work_exps
   has_many :educations   
   has_one :certificate
   has_many :hours 
   accepts_nested_attributes_for :work_exps
   accepts_nested_attributes_for :educations
   private
      def validate_care_team_user_limit
         if care_team_id
            care_team = CareTeam.find_by(id: care_team_id)
            if care_team && care_team.care_givers.count >= CareTeam::NUMBER_OF_PERMITTED_TEAMS
               errors.add(:care_team_id, "User cannot be added to that care team")
            end
         end
      end
end
