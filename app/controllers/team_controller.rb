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
      @check_member = current_care_giver.care_team
      @leader = CareTeam.where(care_giver_id: current_care_giver.id)[0]
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

   def hours
      @family = Family.find(params[:id])
   end

   def leader_hours
      beginning_of_week = Time.current.beginning_of_week
      end_of_week = beginning_of_week.end_of_week
      @job_post = JobPost.find(params[:id])
      @hours = Hour.where(job_post_id:  @job_post.id, created_at: beginning_of_week..end_of_week)
      @companion = 0
      @personal = 0
      @hours.each do |record|
         @companion += record.companion_hours
         @personal += record.personal_hours
      end
      @total
      @care_team = CareTeam.find_by(care_giver_id: current_care_giver.id)
      if @care_team == nil
         @total = "Once you connect with a team you will be able to confirm the teams hours worked on a weekly basis"
      else
         @total = (@companion * @care_team.companion_hrly_price) + (@personal * @care_team.personal_hrly_price)
      end
   end

   def for_the_day(x, y)
      if Hour.where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now), :job_post_id => x, :care_giver_id => y).any? == true         
         return "Exceeds daily limit"
      end
   end

   def create_hours
      @family = Family.find(params[:id])      
      @check = self.for_the_day(@family.job_post.id, current_care_giver.id)
      if @check 
         flash[:notice] =  "You have already logged Your hours for today."
         redirect_to controller: 'team', action: 'hours', id: @family.id  
      else 
         @hours = current_care_giver.hours.create(sanitize_hours)
         @hours.update(job_post_id: @family.job_post.id)
         if @hours.save
            flash[:notice] = "Your hours have been successfully logged."
            redirect_to controller: 'team', action: 'hours', id: @family.id 
         end 
      end
   end
   
   private 
      def sanitize_team
         params.require(:care_team).permit(:team_name, :team_statement, :team_state, :team_city, :personal_hrly_price, :companion_hrly_price)
      end

      def sanitize_hours
         params.require(:hours).permit(:day_worked, :companion_hours, :personal_hours)         
      end
end
