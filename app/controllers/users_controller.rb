class UsersController < ApplicationController

   def index
    @users = User.all
   end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end



  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to(user_path(@user.id))
    else
      render 'edit'
    end
  end

  

  def remove
  end

  def create
    @user = User.new(user_params)
    user = @user
    if @user.save
      if user  == User.first
        user.toggle!(:admin)
      end
      session[:remember_token] = @user.id
      flash[:success] = "Welcome to SnapStereo!"
      redirect_to(user_path(@user.id))
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to index_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end

   
end
