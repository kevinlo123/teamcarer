class FamilyController < ApplicationController
   layout "family_dashboard" 
   before_action :authenticate_family!

   def index
      @family = current_family.job_post 
      @recipient_info = current_family.recipient      
   end

   def my_posting
      @jobpost = current_family.job_post
   end

   def new_post
      @recipient_info = current_family.recipient
      @care_needed = @recipient_info.companion_care.concat(@recipient_info.companion_care)
      @location = "#{@recipient_info.city}, #{@recipient_info.state}"
      @family_contact = "#{current_family.firstname} #{current_family.lastname.titleize.chars.first}"
      @jobpost = current_family.job_post
      @jobpost_title = current_family.job_post.title      
   end

   def create_post
      @jobpost = current_family.create_job_post(sanitize_post)
      if @jobpost.save
         redirect_to family_new_post_path
      else
         render json: @jobpost.errors.full_messages
      end
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
      @teams = CareTeam.all.order('created_at ASC')
   end

   def team_search_results
      @teams = CareTeam.search(params[:search])
      @all_teams = CareTeam.all.order('created_at ASC')
   end
   
   private 
      def sanitize_post
         params.require(:jobpost).permit(:title, :description, :taken, :companion_care, :recipient_conditions, :recipient_gender, :location, :family_contact, :recipient_quality)
      end 
      def sanitize_recipient
         params.require(:recipient).permit(:firstname,:lastname,:gender,:age)
      end
end
