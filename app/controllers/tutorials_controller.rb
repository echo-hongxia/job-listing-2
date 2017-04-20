class TutorialsController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :destroy]

  def index
    @tutorials = Tutorial.order("id DESC").all
  end

  def create
    @tutorail = Tutorial.new(tutorail_params)
    @tutorail.user = current_user
    @tutorail.save
    redirect_to tutorials_path
  end

  def destroy
    @tutorail = current_user.tutorials.find(params[:id])
    @tutorail.destroy
    redirect_to tutorials_path
  end

  def like
    @tutorial = Tutorial.find(params[:id])
    unless @tutorial.find_like(current_user)
      Like.create(:user => current_user, :tutorial => @tutorial)
    end
    redirect_to tutorials_path
  end

  def unlike
    @tutorial = Tutorial.find(params[:id])
    like = @tutorial.find_like(current_user)
    like.destroy
    redirect_to tutorials_path
  end

  protected

  def tutorail_params
    params.require(:tutorial).permit(:title, :url)
  end
end
