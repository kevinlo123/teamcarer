class TeamController < ApplicationController
   layout "team_dashboard" 
   before_action :authenticate_team!   
   def index
      @team = current_team
   end
   def new_team

   end
   def create_team
      @team = CareTeam.new(sanitize_team)
      if @team.save
        unless current_team.care_team
          current_team.update(care_team: @team)
        end
        redirect_to team_root_path
      else
         render html: "Sorry the post wasnt updated"
      end
   end
   def join_team 
      @teams = CareTeam.all
   end
   def all_posts
      @Jobpost = JobPost.all
   end
   def edit_post
      @Jobpost = JobPost.find(params[:id]) 
   end
   def update_post
      @Jobpost = JobPost.find(params[:id])
      if @Jobpost.update(taken: true)
         redirect_to team_posts_path, :flash => { :notice => "Awesome you have requested this job! the family will be in touch soon" }
      else
         render html: "Sorry the post wasnt updated"
      end 
   end
   def my_team
      @team = current_team.care_team      
   end
   def show_team
      @team = CareTeam.find(params[:id])
   end
   def update_team
      @team = CareTeam.find(params[:id])
      if current_team.update(care_team: @team)
        redirect_to team_page_url 
      else
         render html: "Could not join team"
      end
   end
   private 
      def sanitize_team
         params.require(:care_team).permit(:team_name, :team_statement)
      end
end
