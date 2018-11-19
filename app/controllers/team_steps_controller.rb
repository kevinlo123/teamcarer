class TeamStepsController < ApplicationController
   include Wicked::Wizard
   steps :skills_information, :disease_management
   def new
      # @family = current_family      
      # @recipient = current_family.recipient      
   end
   def show
      @team = current_team
      # @recipient = current_family.recipient            
      render_wizard
   end
   # def create
   #    @recipient = current_family.create_recipient(sanitize_recipient)
   #    if @recipient.save
   #        jump_to(:recipient_information_second)
   #    else
   #       render json: @recipient.errors.full_messages
   #    end
   #    render_wizard
   # end
   def update
      # @user = current_family
      # @user.attributes = params[:user]
      # render_wizard @user  
      render_wizard      
   end
   private 
      def sanitize_recipient
         params.require(:recipient).permit(:firstname,:lastname,:gender,:age)
      end
end
