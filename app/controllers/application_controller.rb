class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  def confirm_login
    unless session[:user_id]
      flash[:notice] = "Please login first or Contact HR to get new account"
      redirect_to(:controller => "access", :action => "login")
      return false
    else
      return true
    end
  end
  
  def confirm_faculty
    if session[:user_level].to_i < 5
      redirect_to :controller => "member_zone", :action => "index"
      return false
    else
      return true
    end
  end
  
  def confirm_admin
    if session[:user_level].to_i < 10
      redirect_to :controller => "staff", :action => "todo"
      return false
    else
      return true
    end
  end
  
  def specified_layout
    if session[:user_id]
      role = session[:user_level].to_i
      if role > 5
        "admin"
      elsif role > 1
        "teacher"
      elsif role <= 1 
      "student"
      else
      "application"
      end
    end
  end

end
