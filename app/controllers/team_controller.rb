class TeamController < ApplicationController
   layout "team_dashboard" 
   before_action :authenticate_care_giver!  

   def index
      @team = current_care_giver
   end

   def new_team

   end

   def create_team
      @team = CareTeam.new(sanitize_team)
      if @team.save
         unless current_care_giver.care_team
            current_care_giver.update(care_team: @team)
            @team.update(care_giver: current_care_giver)
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
      @team = current_care_giver.care_team 
      @members = CareGiver.where(care_team: @team)     
   end

   def show_team
      @team = CareTeam.find(params[:id])
      @members = CareGiver.where(care_team: @team)           
   end

   def update_team
      @team = CareTeam.find(params[:id])
      @join_team_message = 'Congratulations on requesting this team the leader will be with you shortly!'
      if current_care_giver.update(care_team: @team) 
         flash[:notice] = @join_team_message        
         redirect_to team_page_url
      else
         flash[:notice] = 'Sorry this team is full!'
         redirect_to show_team_path
      end
   end
   
   private 
      def sanitize_team
         params.require(:care_team).permit(:team_name, :team_statement)
      end
end
