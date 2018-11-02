class FamilyController < ApplicationController
   layout "family_dashboard" 
   before_action :authenticate_family!
   def index
      @Jobpost = JobPost.all
   end
   def allPosts
      @Jobpost = JobPost.all
   end   
   def teamSearch

   end
end
