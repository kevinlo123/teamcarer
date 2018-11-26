class FamilyController < ApplicationController
   layout "family_dashboard" 
   before_action :authenticate_family!
   def index
      @family = current_family      
   end
   def my_posting

   end
   def new_post
      @Jobpost = current_family.Job_posts.build     
   end
   def create_post
      @Jobpost = current_family.Job_posts.build(sanitize_post)
      if @Jobpost.save
         redirect_to family_root_path
      else
         render json: @Jobpost.errors.full_messages
      end
   end
   def all_posts
      @Jobpost = JobPost.all
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
   def teamSearch
      
   end
   private 
      def sanitize_post
         params.require(:Jobpost).permit(:title,:description,:taken)
      end 
      def sanitize_recipient
         params.require(:recipient).permit(:firstname,:lastname,:gender,:age)
      end
end
