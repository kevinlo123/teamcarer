class TeamStepsController < ApplicationController
   include Wicked::Wizard
   steps :skills_information, :disease_management

   def new  

   end

   def show
      @team = current_care_giver
      render_wizard
   end

   def update
      @team = current_care_giver
      @team.update_attributes(sanitize_team)
      render_wizard @team  
   end
   
   private 
      def sanitize_team
         params.require(:care_giver).permit(:firstname,:middlename,:lastname)
      end
end
