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
      @location = "#{@recipient_info.city}, #{@recipient_info.state}"
      @family_contact = "#{current_family.firstname} #{current_family.lastname.titleize.chars.first}"
      @jobpost = current_family.job_post
      @jobpost_title = current_family.job_post.title  
      if @recipient_info.companion_care == nil 
         @care_needed =  @recipient_info.personal_care 
      elsif @recipient_info.personal_care == nil 
         @care_needed =  @recipient_info.companion_care 
      else
         @care_needed = @recipient_info.companion_care.concat(@recipient_info.personal_care)
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
      @recipient.update(companion_care: params[:companion_care])
      @recipient.update(personal_care: params[:personal_care])   
      if @recipient.update(sanitize_recipient)
         redirect_to family_root_path
      else
         render html: "Sorry your recipient wasnt updated"
      end
   end

   def my_posting
      @job_post = current_family.job_post
   end

   def update_post
      @jobpost = current_family.job_post.update_attributes(sanitize_post)
      current_family.job_post.update(public: true)
      if @jobpost
         redirect_to family_root_path
      else
         render json: @jobpost.errors.full_messages
      end
   end


   def edit_posting
      @my_posting = current_family.job_post
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
      if @recipient.update(sanitize_recipient)
         redirect_to family_recipient_path
      else
         render html: "Sorry your post wasnt updated"
      end
   end

   def team_search  
      @teams = CareTeam.paginate(:page => params[:page], :per_page => 2).order('created_at ASC')
      @all_teams = CareTeam.all.order('created_at ASC')      
   end

   def team_search_results
      @teams = CareTeam.search(params[:search]).paginate(page: params[:page],:per_page => 5)
      @all_teams = CareTeam.all.order('created_at ASC')
   end

   def team_search_results_state
      @teams = CareTeam.search_state(params[:search]).paginate(page: params[:page],:per_page => 1)
      @all_teams = CareTeam.all.order('created_at ASC')
   end

   def team_search_results_city
      @teams = CareTeam.search_city(params[:search])
      @all_teams = CareTeam.all.order('created_at ASC')
   end
   
   private 
      def sanitize_post
         params.require(:jobpost).permit(:title, :description, :taken, :companion_care, :recipient_conditions, :recipient_gender, :location, :family_contact, :recipient_quality)
      end 
      def sanitize_recipient
         params.require(:recipient).permit(:firstname,:lastname,:gender,:age,:city,:state,:quality)
      end
end
