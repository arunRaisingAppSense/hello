class WelcomeController < ApplicationController
	#layout 'mylayout'
	before_action :authenticate_user! , except: [:index, :welcome]
	
	before_action :my_authentication
   
  def my_authentication
     if user_signed_in? 
        # do something ...
        redirect_to candies_path
     end
  end

  def index
  end
end
