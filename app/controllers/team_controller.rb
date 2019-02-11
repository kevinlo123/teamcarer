class TeamController < ApplicationController
   layout "team_dashboard" 
   before_action :authenticate_care_giver!  

   def index
      @team = current_care_giver
      @check_member = current_care_giver.care_team
      @leader = CareTeam.where(care_giver_id: current_care_giver.id)[0]
   end

   def new_team

   end

   def create_team
      @team = CareTeam.new(sanitize_team)
      if @team.save
         unless current_care_giver.care_team
            current_care_giver.update(leader: true)
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

   def search_results
      @teams = CareTeam.search(params[:search]).paginate(page: params[:page],:per_page => 5)
      @all_teams = CareTeam.all.order('created_at ASC')
   end

   def search_results_state
      @teams = CareTeam.search_state(params[:search]).paginate(page: params[:page],:per_page => 5)
      @all_teams = CareTeam.all.order('created_at ASC')
   end

   def search_results_city
      @teams = CareTeam.search_city(params[:search]).paginate(page: params[:page],:per_page => 5)
      @all_teams = CareTeam.all.order('created_at ASC')
   end

   def all_posts
      @caregiver = CareGiver.find(params[:id])
      @jobs_by_state = JobPost.where(public: true, state: "#{@caregiver.state}").paginate(page: params[:page],:per_page => 5)
      @Jobpost = JobPost.where(public: true, city: "#{@caregiver.city}").paginate(page: params[:page],:per_page => 2)
   end

   def edit_post
      @Jobpost = JobPost.find(params[:id]) 
      @email = @Jobpost.family.email
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
      # @team = CareTeam.find(params[:id])
      # @current_user = CareGiver.find(current_care_giver.id);
      # # @leader = CareTeam.where(care_giver_id: current_care_giver.id)[0]
      # @members = CareGiver.where(care_team: @team)
      @families = Family.where(care_team_id: params[:id]) 
      @care_team = CareTeam.find(params[:id])
      @care_team_members = CareGiver.all.where(care_team: params[:id])    
   end

   def remove_member
      @member = CareGiver.find(params[:id]);
      @leader = CareTeam.where(care_giver_id: current_care_giver.id)[0]
      @member.update(care_team: nil)
      redirect_to my_care_team_path(:id => @leader)
   end

   def show_team
      @care_team = CareTeam.find(params[:id]) 
      @care_team_members = CareGiver.all.where(care_team: params[:id]) 
   end

   def show_member
      @member = CareGiver.find(params[:id])  
      @leader = CareTeam.find_by(care_giver_id: params[:id])
      @work_exp = WorkExp.where(care_giver_id: params[:id]) 
      @certificates = Certificate.where(care_giver_id: params[:id]) 
      @education = Education.where(care_giver_id: params[:id]) 
   end

   def update_team
      @team = CareTeam.find(params[:id])
      @join_team_message = 'Congratulations on requesting this team the leader will be with you shortly!'
      if current_care_giver.update(care_team: @team) 
         flash[:notice] = @join_team_message        
         redirect_to team_root_path
      else
         flash[:notice] = 'Sorry this team is full!'
         redirect_to show_team_path
      end
   end
   
   private 
      def sanitize_team
         params.require(:care_team).permit(:team_name, :team_statement, :team_state, :team_city, :personal_hrly_price, :companion_hrly_price)
      end
end
