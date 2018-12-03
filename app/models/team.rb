class Team < ApplicationRecord
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable 
   validates_presence_of :phone, :city, :state, :street, :zip, presence: true, on: :create
   belongs_to :care_team, optional: true 
   validate :validate_care_team_user_limit
   private
      def validate_care_team_user_limit
         if care_team_id
            care_team = CareTeam.find_by(id: care_team_id)
            if care_team && care_team.teams.count > CareTeam::NUMBER_OF_PERMITTED_TEAMS
               errors.add(:care_team_id, "User cannot be added to that care team")
            end
         end
      end
   STATES = 
      [
         ['Alabama', 'AL'],
         ['Alaska', 'AK'],
         ['Arizona', 'AZ'],
         ['Arkansas', 'AR'],
         ['California', 'CA'],
         ['Colorado', 'CO'],
         ['Connecticut', 'CT'],
         ['Delaware', 'DE'],
         ['District of Columbia', 'DC'],
         ['Florida', 'FL'],
         ['Georgia', 'GA'],
         ['Hawaii', 'HI'],
         ['Idaho', 'ID'],
         ['Illinois', 'IL'],
         ['Indiana', 'IN'],
         ['Iowa', 'IA'],
         ['Kansas', 'KS'],
         ['Kentucky', 'KY'],
         ['Louisiana', 'LA'],
         ['Maine', 'ME'],
         ['Maryland', 'MD'],
         ['Massachusetts', 'MA'],
         ['Michigan', 'MI'],
         ['Minnesota', 'MN'],
         ['Mississippi', 'MS'],
         ['Missouri', 'MO'],
         ['Montana', 'MT'],
         ['Nebraska', 'NE'],
         ['Nevada', 'NV'],
         ['New Hampshire', 'NH'],
         ['New Jersey', 'NJ'],
         ['New Mexico', 'NM'],
         ['New York', 'NY'],
         ['North Carolina', 'NC'],
         ['North Dakota', 'ND'],
         ['Ohio', 'OH'],
         ['Oklahoma', 'OK'],
         ['Oregon', 'OR'],
         ['Pennsylvania', 'PA'],
         ['Puerto Rico', 'PR'],
         ['Rhode Island', 'RI'],
         ['South Carolina', 'SC'],
         ['South Dakota', 'SD'],
         ['Tennessee', 'TN'],
         ['Texas', 'TX'],
         ['Utah', 'UT'],
         ['Vermont', 'VT'],
         ['Virginia', 'VA'],
         ['Washington', 'WA'],
         ['West Virginia', 'WV'],
         ['Wisconsin', 'WI'],
         ['Wyoming', 'WY']
      ]
end
