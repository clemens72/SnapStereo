class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:remember_token] = user.id
      redirect_to(user_path(user.id))
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end 
     
  end

  def destroy
    session[:remember_token] = nil
    redirect_to root_url
  end  
end
