class LoginsController < ApplicationController
  
  def new
    
  end
  
  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "Awesome! You're logged in!"
      redirect_to recipes_path
    else
      flash.now[:danger] = "Yikes! Your email or password isn't correct."
      render 'new'
    end
    
  end
    
  def destroy
    session[:chef_id] = nil
    flash[:success] = "You've been logged out. Sorry to see you go!"
    redirect_to root_path
  end
  
    
end