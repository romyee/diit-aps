class StaffController < ApplicationController
  before_filter :confirm_login
  before_filter :confirm_faculty
  layout :specified_layout
  
  def index
    redirect_to :action => "todo"
  end
  
  def todo
    @processes = ApplicationProcess.where(:reffer_to_id => session[:user_id], :status => 1).order("created_at DESC")
  end
  
  def init_application_details
    if params[:id]
      @process = ApplicationForm.find(params[:id])
    else
      redirect_to :action => "dashboard", :controller => "admin"
    end
  end
  
  def application_details
    if params[:id]
      @process = ApplicationProcess.find(params[:id])
    else
      redirect_to :action => "todo"
    end
  end
end
