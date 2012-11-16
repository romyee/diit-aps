class MemberZoneController < ApplicationController
  before_filter :confirm_login
  layout :specified_layout
  
  def index
    redirect_to :action => "dashboard"
  end
  
  def dashboard
    @applications = ApplicationForm.where(:user_id => session[:user_id]).order("created_at DESC")
  end
  
  def forms
    @forms = Form.all
  end
  
  def apply
  end
  
  def profile
    @user = User.where(:id => session[:user_id]).first
  end
  
  def check_status
  end
  
  def application_status
    if params[:tracking_number]
      @applications = ApplicationForm.where(:tracking_id => params[:tracking_number])
      if @applications.size > 0
        @application = @applications.first 
        if @application.user_id == session[:user_id]
          @histories = @application.application_processes.order("created_at DESC")
        else
          render "restricted"
        end
      else
        render "invalid"
      end
    else
      redirect_to :action => "check_status"
    end
  end
  
end
