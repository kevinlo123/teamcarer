class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   after_create :welcome_email
   def welcome_email
      WelcomeMailer.welcome_email(self).deliver
   end  
end
