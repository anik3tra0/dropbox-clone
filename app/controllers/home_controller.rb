# Home Controller Class
class HomeController < ApplicationController
  def index
  	if user_signed_in? 
      @uploads = current_user.uploads.order("created_at desc")       
 	end
  end
end
