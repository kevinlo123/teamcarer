class CareGiverStepsController < ApplicationController
   include Wicked::Wizard
   steps :skills_information, :disease_management, :yes_no, :experience, :personal_statement

   def new  

   end

   def show
      @team = current_care_giver
      # 3.times{@team.work_exps.build}
      # @team.educations.build
      render_wizard
   end

   def city
      @cities = CS.get(:us,params[:state]) 
      respond_to do |format|
         format.js { render '/care_giver_steps/state.js.erb' }         
         format.html { redirect_to "care_giver_steps/personal_statement" } 
      end
   end

   def update
      case step
      when :experience
         @care_giver = current_care_giver
         @care_giver.update(sanitize_team)
         @care_giver.educations.create(sanitize_education) 
         if !params[:certificates][:school_program].empty? && !params[:certificates][:certificate].empty? &&
            !params[:certificates][:state].empty? && !params[:certificates][:from].empty? && !params[:certificates][:to].empty?
            @cert = current_care_giver.create_certificate(sanitize_certificates)
            @cert.save   
         end
         jump_to(:personal_statement)  
         render_wizard   
      end 
   end

   def skills_information
      if current_care_giver.confirmed? == false 
         render template: "layouts/confirm_email"
      elsif params[:companion_care].blank? && params[:personal_care].blank? 
         redirect_to "/care_giver_steps/skills_information"          
         flash[:notice] = "Please select at least one condition"
      elsif params[:languages].blank?
         redirect_to "/care_giver_steps/skills_information"          
         flash[:notice] = "Please select a language"
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
      if params[:conditions].last == ""
         params[:conditions].pop
      end
      if params[:conditions].blank? 
         redirect_to "/care_giver_steps/disease_management"          
         flash[:notice] = "Please select at least one condition below"
      else
         @team.update(conditions: params[:conditions]) 
         @team.update(related_service: params[:related_service])       
         jump_to(:yes_no)         
         render_wizard  
      end
   end

   def yes_no
      @team = current_care_giver
      @team.update_attributes(sanitize_team) 
      jump_to(:experience)   
      render_wizard  
   end
   
   def personal_statement
      @team = current_care_giver
      if @team.update_attributes(sanitize_team) 
         redirect_to team_root_path 
      end
   end

   private 
      def sanitize_team
         params.require(:care_giver).permit(:firstname,:middlename,:lastname,:dependable_car, :physical_issues, :tb_malaria, :smoke, :smoke_several_hours, :drugs_alcohol, :felonies, :years_experience, :authorized, :statement, work_exps_attributes: [:id, :employer, :title, :state, :city, :from, :to])
      end
      def sanitize_work
         params.require(:work_exps).permit(:employer, :title, :state, :city, :from, :to)
      end
      def sanitize_education
         params.require(:educations).permit(:major,:school,:degree,:state,:city,:from,:to)
      end
      def sanitize_certificates
         params.require(:certificates).permit(:school_program,:certificate,:certificatid,:state,:from,:to)
      end
end
