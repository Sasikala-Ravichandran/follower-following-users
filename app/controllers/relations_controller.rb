class RelationsController < ApplicationController
  def create
     	@activerelation = current_user.activerelations.build(:followed_id => params[:followed_id])
    if @activerelation.save
    	flash[:notice] = "Successfully followed"
    	redirect_to users_path
    else
    	flash[:error] = "unable to follow"
    	redirect_to users_path
    end
  end

  def destroy
    @activerelation = current_user.activerelations.find_by_followed_id(params[:id])
    @activerelation.destroy
    redirect_to users_path

  end
end
