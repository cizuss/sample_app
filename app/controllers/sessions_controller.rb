class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # We did it reddit
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to home_path
  end
end
