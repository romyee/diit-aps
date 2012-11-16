class AccessController < ApplicationController
  
  def index
  end
  def testemail
    Notifications.signup(User.find(3)).deliver
  end
  
  def privilage
    if session[:user_level] == 5
      redirect_to :controller => "staff", :action => "todo"
    elsif session[:user_level] == 10
      redirect_to :controller => "admin", :action => "dashboard"
    else
      redirect_to :controller => "member_zone", :action => "index"
    end
  end
  
  def login
    if session[:user_id]
      redirect_to(:action => "privilage")
    end
  end
  
  def attempt_login
    auth_user = User.authenticate(params[:email], params[:password])
    if auth_user
      session[:user_id] = auth_user.id
      session[:user_level] = auth_user.role
      session[:name] = "#{auth_user.first_name} #{auth_user.last_name}"
      flash[:notice] = "You are logged in successfully!"
      redirect_to :action => "privilage"
    else
      flash[:notice] = "Email and password did not match"
      redirect_to :action => "login"
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:user_level] = nil
    session[:name] = nil
    flash[:notice] =  "Logout successfully!"
    redirect_to :action => "login"
  end
end
