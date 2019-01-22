class PagesController < ApplicationController
   def home
      @message = Message.new
   end

   def family
      @message = Message.new      
      if family_signed_in?
         redirect_to(family_root_path)       
      end
   end
   
   def care_giver
      @message = Message.new      
      if care_giver_signed_in?
         redirect_to(team_root_path)       
      end
   end

   def create
      @message = Message.new message_params
      if @message.valid?
         MessageMailer.contact_me(@message).deliver_now         
         redirect_to root_path, notice: "Message received, thanks!"
      else
         render :home
      end
      # if request.original_url == root_path         
      #    redirect_to root_path, notice: "Message received, thanks!"
      # elsif request.original_url == "family_page"
      #    redirect_to "family_page", notice: "Message received, thanks!"
      # else
      #    redirect_to "care_giver_page", notice: "Message received, thanks!"
      # end
   end
   private
      def message_params
         params.require(:message).permit(:name, :email, :body)
      end
end
