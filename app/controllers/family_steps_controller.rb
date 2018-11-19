class FamilyStepsController < ApplicationController
   include Wicked::Wizard
   steps :recipient_information, :recipient_information_second
   def new
      @family = current_family      
      @recipient = current_family.recipient      
   end
   def show
      @family = current_family
      @recipient = current_family.recipient            
      render_wizard
   end
   def create
      @recipient = current_family.create_recipient(sanitize_recipient)
      if @recipient.save
          jump_to(:recipient_information_second)
      else
         render json: @recipient.errors.full_messages
      end
      render_wizard
   end
   def update
      # @user = current_family
      # @user.attributes = params[:user]
      # render_wizard @user      
   end
   private 
      def sanitize_recipient
         params.require(:recipient).permit(:firstname,:lastname,:gender,:age)
      end
end
