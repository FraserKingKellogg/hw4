class SessionsController < ApplicationController

  
  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Hello."
        redirect_to "/posts"
      else
        flash["notice"] = "Wrong password"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Email not registered"
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end

  