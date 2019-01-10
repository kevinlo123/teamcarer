class CareGiverStepsController < ApplicationController
   include Wicked::Wizard
   steps :skills_information, :disease_management, :yes_no, :personal_statement

   def new  

   end

   def show
      @team = current_care_giver
      render_wizard
   end

   def update
      if current_care_giver.confirmed? == false 
         render template: "layouts/confirm_email"
      else         
         @team = current_care_giver
         @team.update(companion_care: params[:companion_care])
         @team.update(personal_care: params[:personal_care])  
         @team.update(languages: params[:languages]) 
         jump_to(:disease_management)  
         render_wizard
      end  
   end

   def conditions
      @team = current_care_giver
      @team.update(conditions: params[:conditions]) 
      @team.update(related_service: params[:related_service])       
      jump_to(:yes_no)         
      render_wizard  
   end

   def yes_no
      @team = current_care_giver
      @team.update_attributes(sanitize_team) 
      jump_to(:personal_statement)   
      render_wizard  
   end
   
   def personal_statement
      @team = current_care_giver
      if @team.update_attributes(sanitize_team) 
         redirect_to team_root_url
      end
   end

   private 
      def sanitize_team
         params.require(:care_giver).permit(:firstname,:middlename,:lastname,:dependable_car, :physical_issues, :tb_malaria, :smoke, :smoke_several_hours, :drugs_alcohol, :felonies, :years_experience, :authorized, :statement)
      end
end
