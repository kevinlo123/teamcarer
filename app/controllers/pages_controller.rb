class PagesController < ApplicationController
   def home

   end
   def family
      if family_signed_in?
         redirect_to(family_root_path)       
      end
   end
   def team

   end
end
