class FamilyController < ApplicationController
   layout "family_dashboard" 
   before_action :authenticate_family!
   def index
      @Jobpost = JobPost.all
   end
   def allPosts
      @Jobpost = JobPost.all
   end 
   def new
      @Jobpost = current_family.Job_posts.build     
   end
   def create
      @Jobpost = current_family.Job_posts.build(sanitize_params)
      if @Jobpost.save
         redirect_to family_root_path
      else
         render json: @Jobpost.errors.full_messages
      end
   end
   def teamSearch
      
   end
   private 
      def sanitize_params
         params.require(:Jobpost).permit(:title,:description,:taken)
      end  
end
