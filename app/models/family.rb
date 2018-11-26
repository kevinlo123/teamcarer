class Family < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
   validates_presence_of :firstname, :lastname, :city, presence: true, on: :create
   has_many :Job_posts
   has_one :recipient 
end
