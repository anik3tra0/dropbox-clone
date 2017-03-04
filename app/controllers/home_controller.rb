# Home Controller Class
class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		@folders = current_user.folders.where("parent_id is null").order('name desc')
      @uploads = current_user.uploads.where('folder_id IS NULL').order('created_at desc')
 	  end
  end

  def browse
    #get the folders owned/created by the current_user
    @current_folder = current_user.folders.find(params[:folder_id])

    if @current_folder

      #getting the folders which are inside this @current_folder
      @folders = @current_folder.children

      #We need to fix this to show files under a specific folder if we are viewing that folder
      @uploads = @current_folder.uploads.sort_by {|u| u.file_name }

      render :action => "index"
    else
      flash[:error] = "No! No! No! That folder doesn't belong to you"
      redirect_to root_url
    end
	end
end
