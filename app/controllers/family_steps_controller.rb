class FamilyStepsController < ApplicationController
   include Wicked::Wizard
   steps :recipient_information, :recipient_information_second

   def show
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
      @recipient = current_family.recipient  
      @recipient.update_attributes(sanitize_recipient)
      redirect_to family_root_path
   end
   
   private 
      def sanitize_recipient
         params.require(:recipient).permit(:firstname,:lastname,:gender,:age)
      end
end
