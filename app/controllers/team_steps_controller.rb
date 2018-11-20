class TeamStepsController < ApplicationController
   include Wicked::Wizard
   steps :skills_information, :disease_management
   def new  
   end
   def show
      @team = current_team
      render_wizard
   end
   def update
      @team = current_team
      @team.update_attributes(sanitize_team)
      render_wizard @team  
   end
   private 
      def sanitize_team
         params.require(:team).permit(:firstname,:middlename,:lastname)
      end
end
