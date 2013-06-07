class UsersController < ApplicationController
 def index
  	@users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    #save the post data
    @user.update_attributes(params[:user])

    if @user.save
      flash[:success] = "Profile updated!"
    elsif 
      flash[:error] = "#{@user.errors.count} errors prohibited this post from being saved"
    end

    redirect_to edit_user_path
  end

  def destroy
   	@user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def create
  	@user = User.new(params[:user])
    
    if @user.save
      flash[:success] = "#{@user.name} is now added!"
    elsif 
      flash[:error] = @user.errors.full_messages
    end

    redirect_to new_user_path
  end
end
