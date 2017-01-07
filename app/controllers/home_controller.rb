# Home Controller Class
class HomeController < ApplicationController
  def index
  	if user_signed_in? 
  		@folders = current_user.folders.order('name desc')
      @uploads = current_user.uploads.order('created_at desc')       
 	end
  end
end
