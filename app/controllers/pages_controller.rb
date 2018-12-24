class PagesController < ApplicationController
   def home

   end

   def family
      if family_signed_in?
         redirect_to(family_root_path)       
      end
   end
   
   def team
      if care_giver_signed_in?
         redirect_to(team_root_path)       
      end
   end
end
