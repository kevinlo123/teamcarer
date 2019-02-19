class ChargesController < ApplicationController
  layout "family_dashboard"
  before_action :authenticate_family!

   def new
      beginning_of_week = Time.current.beginning_of_week
      end_of_week = beginning_of_week.end_of_week
      if current_family.job_post == nil
         @hours = ""
      else
         @hours = Hour.where(job_post_id: current_family.job_post.id, created_at: beginning_of_week..end_of_week)
         @companion = 0
         @personal = 0
         @hours.each do |record|
            @companion += record.companion_hours
            @personal += record.personal_hours
         end
         @total
         @care_team = CareTeam.find_by(id: current_family.care_team_id)
         if @care_team == nil
            @total = "Once you connect with a team you will be able to confirm the teams hours worked on a weekly basis"
         else
            @total = (@companion * @care_team.companion_hrly_price) + (@personal * @care_team.personal_hrly_price)
            @total_in_cents = @total * 100;
         end
      end
   end

   def create
      beginning_of_week = Time.current.beginning_of_week
      end_of_week = beginning_of_week.end_of_week
      @hours = Hour.where(job_post_id: current_family.job_post.id, created_at: beginning_of_week..end_of_week)
      @companion = 0
      @personal = 0
      @hours.each do |record|
         @companion += record.companion_hours
         @personal += record.personal_hours
      end
      @total
      @care_team = CareTeam.find_by(id: current_family.care_team_id)
      if @care_team == nil
         @total = "Once you connect with a team you will be able to confirm the teams hours worked on a weekly basis"
      else
         @total = (@companion * @care_team.companion_hrly_price) + (@personal * @care_team.personal_hrly_price)
         @total_in_cents = @total * 100;
      end
      customer = Stripe::Customer.create(
         :email => params[:stripeEmail],
         :source  => params[:stripeToken]
      )
      charge = Stripe::Charge.create(
         :customer    => customer.id,
         :amount      => @total_in_cents,
         :description => 'Rails Stripe customer',
         :currency    => 'usd'
      )
      rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to family_root_path
   end
end
