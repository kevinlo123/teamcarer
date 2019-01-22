class MessageMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject
  #

   def contact_general(message)
      @name = message.name.titleize
      @body = message.body    
      mail to: "welcome@teamcarer.com", from: 'welcome@teamcarer.com', subject: 'General Inquiry'
   end
   def contact_care_giver(message)
      @name = message.name.titleize
      @body = message.body    
      mail to: "welcome@teamcarer.com", from: 'welcome@teamcarer.com', subject: 'Care Giver Inquiry'
   end
   def contact_family(message)
      @name = message.name.titleize
      @body = message.body    
      mail to: "welcome@teamcarer.com", from: 'welcome@teamcarer.com', subject: 'Family Inquiry'
   end
end
