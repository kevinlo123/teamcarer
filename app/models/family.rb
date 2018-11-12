class Family < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :Job_posts
   has_one :recipient 
   after_create :welcome_email
   def welcome_email
      WelcomeMailer.welcome_email(self).deliver
   end  
end
