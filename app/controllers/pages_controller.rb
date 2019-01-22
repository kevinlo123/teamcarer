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
      if @message.valid? && URI(request.referer).path == "/"
         MessageMailer.contact_general(@message).deliver_now         
         redirect_to root_path, notice: "Message received, thanks!"
      elsif @message.valid? && URI(request.referer).path == "/care_giver_page"
         MessageMailer.contact_care_giver(@message).deliver_now         
         redirect_to "/care_giver_page", notice: "Message received, thanks!"
      elsif @message.valid? && URI(request.referer).path == "/family_page"
         MessageMailer.contact_family(@message).deliver_now         
         redirect_to "/family_page", notice: "Message received, thanks!"
      else
         render :home         
      end
   end
   
   private
      def message_params
         params.require(:message).permit(:name, :email, :body)
      end
end
