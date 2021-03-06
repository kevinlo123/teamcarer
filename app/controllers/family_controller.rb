class FamilyController < ApplicationController
   layout "family_dashboard"
   before_action :authenticate_family!

   def index
      @family = current_family.job_post
      @recipient_info = current_family.recipient
      if current_family.job_post
         if current_family.job_post.public == false
            redirect_to family_new_post_path
         end
      end
   end

   def new_post
      @recipient_info = current_family.recipient
      @city = "#{@recipient_info.city}"
      @state = "#{@recipient_info.state}"
      @family_contact = "#{current_family.firstname.titleize} #{current_family.lastname.titleize.chars.first}"
      @jobpost = current_family.job_post
      @jobpost_title = current_family.job_post.title
      if @recipient_info.companion_care == nil
         @care_needed =  @recipient_info.personal_care
      elsif @recipient_info.personal_care == nil
         @care_needed =  @recipient_info.companion_care
      else
         @care_needed = @recipient_info.companion_care + @recipient_info.personal_care
      end
   end

   def create_post
      @jobpost = current_family.create_job_post(sanitize_post)
      if @jobpost.save
         redirect_to family_new_post_path
      else
         render json: @jobpost.errors.full_messages
      end
   end

   def update_recipient_for_post
      @recipient = current_family.recipient
      if !params[:companion_care].blank? 
         @recipient.update(companion_care: params[:companion_care])
      elsif !params[:personal_care].blank?
         @recipient.update(personal_care: params[:personal_care])         
      end
      if @recipient.update(sanitize_recipient)
         redirect_to family_root_path
         flash[:notice] = "Your post has been updated"                                    
      else
         render html: "Sorry your recipient wasnt updated"
      end
   end

   def my_posting
      @job_post = current_family.job_post
      beginning_of_week = Time.current.beginning_of_week
      end_of_week = beginning_of_week.end_of_week
      if current_family.job_post == nil
         @hours = ""
      else
         @hours = Hour.where(job_post_id: current_family.job_post.id, created_at: beginning_of_week..end_of_week)
         @companion = 0
         @personal = 0
         @hours.each do |record|
            @companion += record.companion_hours
            @personal += record.personal_hours
         end
         @total
         @care_team = CareTeam.find_by(id: current_family.care_team_id)
         if @care_team == nil
            @total = "Once you connect with a team you will be able to confirm the teams hours worked on a weekly basis"
         else
            @total = (@companion * @care_team.companion_hrly_price) + (@personal * @care_team.personal_hrly_price)
         end
      end
   end

   def update_post
      @jobpost = current_family.job_post.update_attributes(sanitize_post)
      current_family.job_post.update(public: true)
      if @jobpost
         redirect_to search_team_path
      else
         render json: @jobpost.errors.full_messages
      end
   end

   def delete_post
      @job_post = JobPost.find(params[:id])
      if @job_post.delete
         redirect_to family_root_path
      end
   end


   def edit_posting
      @my_posting = current_family.job_post
      @recipient = current_family.recipient
   end


   def recipient
      @recipient = current_family.recipient
   end

   def create_family_recipient
      @recipient = current_family.create_recipient(sanitize_recipient)
      if @recipient.save
         redirect_to family_recipient_path
      else
         render json: @recipient.errors.full_messages
      end
   end

   def edit_recipient
      @recipient = Recipient.find(params[:id])
   end

   def update_recipient
      @recipient = Recipient.find(params[:id])
      if @recipient.update_attributes(sanitize_recipient)
         if params[:conditions].last == ""
            params[:conditions].pop
         end
         if params[:companion_care] && params[:personal_care] && params[:mobility] && params[:conditions]
            @recipient.update(companion_care: params[:companion_care])
            @recipient.update(personal_care: params[:personal_care])
            @recipient.update(conditions: params[:conditions])            
            @recipient.update(mobility: params[:mobility])            
            redirect_to family_recipient_path
            flash[:notice] = "Recipient has been successfully updated." 
         elsif params[:companion_care]  
            @recipient.update(companion_care: params[:companion_care])
            redirect_to family_recipient_path
            flash[:notice] = "Recipient has been successfully updated." 
         elsif params[:personal_care]  
            @recipient.update(personal_care: params[:personal_care])
            redirect_to family_recipient_path
            flash[:notice] = "Recipient has been successfully updated." 
         elsif params[:conditions]  
            @recipient.update(conditions: params[:conditions])            
            redirect_to family_recipient_path
            flash[:notice] = "Recipient has been successfully updated."
         elsif params[:mobility]
            @recipient.update(mobility: params[:mobility])
            redirect_to family_recipient_path  
            flash[:notice] = "Recipient has been successfully updated."                                       
         else
            redirect_to family_recipient_path
         end
      else
         render html: "Sorry your post wasnt updated"
      end
   end

   def team_search
      @teams = CareTeam.paginate(:page => params[:page], :per_page => 5).order('created_at ASC')
      @all_teams = CareTeam.all.order('created_at ASC')
   end

   def team_search_results
      @teams = CareTeam.search(params[:search]).paginate(page: params[:page],:per_page => 5)
      @all_teams = CareTeam.all.order('created_at ASC')
   end

   def team_search_results_city
      @teams = CareTeam.search_both(params[:city],params[:state]).paginate(page: params[:page],:per_page => 5) if params[:state].present? && params[:city].present?      
      @all_teams = CareTeam.all.order('created_at ASC')
   end

   def team_show
      @care_team = CareTeam.find(params[:id])
      @care_team_members = CareGiver.all.where(care_team: params[:id])
   end

   def team_show_member
      @member = CareGiver.find(params[:id])
      @leader = CareTeam.find_by(care_giver_id: params[:id])
      @work_exp = WorkExp.where(care_giver_id: params[:id])
      @certificates = Certificate.where(care_giver_id: params[:id])
      @education = Education.where(care_giver_id: params[:id])
   end

   def team_selection
      @care_team = CareTeam.find(params[:id])
      if current_family.update(care_team_id: params[:id])
         redirect_to my_team_path(:id => params[:id]) 
         flash[:notice] = "Congratulations! you are now connection with #{@care_team.team_name}"                           
      end    
   end

   def my_team
      @care_team = CareTeam.find(params[:id])
      @care_team_members = CareGiver.all.where(care_team: params[:id])
   end

   def remove_team
      current_family.update(care_team_id: nil)
      redirect_to family_root_path
   end

   private
      def sanitize_post
         params.require(:jobpost).permit(:title, :description, :taken, :companion_care, :recipient_conditions, :recipient_gender, :family_contact, :recipient_quality, :city, :state)
      end

      def sanitize_recipient
         params.require(:recipient).permit(:firstname, :lastname, :gender, :age, :city, :state, :quality, :primary_language, :phone, :address)
      end
end
