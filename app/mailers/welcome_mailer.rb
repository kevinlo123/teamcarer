class WelcomeMailer < ApplicationMailer
   def welcome_email(user)
      @user = user
      mail to: user.email, subject: "Thanks for signing up!", from: "info@mysite.com"
      # mail(to: user.email, subject: "Welcome to Teamcarer!", from: "info@mysite.com")
   end
end
