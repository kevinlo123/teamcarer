class Family < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
   validates_presence_of :firstname, :lastname, :city, :phone, presence: true, on: :create
   has_one :job_post
   has_one :recipient
   has_many :care_teams
end
