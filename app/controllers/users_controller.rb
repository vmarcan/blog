class UsersController < ApplicationController
   before_filter :require_login
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => "User #{@user.username} added!"
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, :notice => "User #{@user.username} deleted!"}
      format.json { head :no_content }
    end
  end
end