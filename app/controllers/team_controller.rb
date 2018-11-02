class TeamController < ApplicationController
   layout "team_dashboard" 
   before_action :authenticate_team!   
   def index

   end
   def allPosts
      @Jobpost = JobPost.all
   end
   def team

   end
end
