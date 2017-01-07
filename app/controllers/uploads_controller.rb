class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = current_user.uploads.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = current_user.uploads.build
    if params[:folder_id] #if we want to upload a file inside another folder
      @current_folder = current_user.folders.find(params[:folder_id]) 
      @upload.folder_id = @current_folder.id
    end
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = current_user.uploads.build(upload_params)
    if @upload.save 
      flash[:notice] = "Successfully uploaded the file."
      if @upload.folder #checking if we have a parent folder for this file 
        redirect_to browse_path(@upload.folder)  #then we redirect to the parent folder 
      else
        redirect_to root_url 
      end      
    else
     render 'new'
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = current_user.uploads.find(params[:id]) 
    @parent_folder = @upload.folder #grabbing the parent folder before deleting the record 
    @upload.destroy 
    flash[:notice] = "Successfully deleted the file."
    
    #redirect to a relevant path depending on the parent folder 
    if @parent_folder
     redirect_to browse_path(@parent_folder) 
    else
     redirect_to root_url 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = current_user.uploads.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:upload, :user_id, :folder_id)
    end
end
