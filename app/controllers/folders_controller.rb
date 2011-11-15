class FoldersController < ApplicationController
  def index
    @folders = Folder.all
    @folder = Folder.new()
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @folder = Folder.create(params[:folder])
    
    @folder.save!
    #flash[:notice] = "Task added."
    
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
