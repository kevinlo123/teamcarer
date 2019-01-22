class MessageMailer < ApplicationMailer
   # default :from => '"Teamcarer" <teamcarer.herokuapp.com>'   
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject
  #

   def contact_me(message)
      @greeting = "Hi"
      @body = message.body    
      mail to: "welcome@teamcarer.com", from: message.email, subject: 'Inquiry'
   end
end
