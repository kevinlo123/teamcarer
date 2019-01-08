class FamilyStepsController < ApplicationController
   include Wicked::Wizard
   before_action :authenticate_family! 
   steps :recipient_information, :care_needed, :recipient_qualities, :recipient_conditions, :recipient_information_fifth   

   def show
      @recipient = current_family.recipient 
      render_wizard
   end

   def create
      if current_family.confirmed? == false
         render html: "please confirm your email address!"
      else
         @recipient = current_family.create_recipient(sanitize_recipient)
         if @recipient.save
            jump_to(:care_needed)       
         else      
            render json: @recipient.errors.full_messages
         end
         render_wizard         
      end
   end

   def care_needs
      @recipient = current_family.recipient
      @recipient.update(companion_care: params[:companion_care])
      @recipient.update(personal_care: params[:personal_care])      
      jump_to(:recipient_qualities)                                
      render_wizard
   end

   def mobility_quality
      @recipient = current_family.recipient      
      @recipient.update(mobility: params[:mobility])
      @recipient.update_attributes(sanitize_recipient)      
      jump_to(:recipient_conditions)   
      render_wizard      
   end

   def conditions
      @recipient = current_family.recipient 
      @recipient.update(conditions: params[:conditions]) 
      @recipient.update_attributes(sanitize_recipient)            
      jump_to(:recipient_information_fifth)   
      render_wizard      
   end
   
   private 
      def sanitize_recipient
         params.require(:recipient).permit(:firstname, :lastname, :gender, :age, :primary_language, :phone, :address, :city, :state, :quality, :recently_discharged, :hospice, :hours_weekly, :months)
      end
end
