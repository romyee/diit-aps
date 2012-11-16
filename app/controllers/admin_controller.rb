class AdminController < ApplicationController
  before_filter :confirm_login
  before_filter :confirm_faculty
  before_filter :confirm_admin
  def dashboard
    @processes = ApplicationForm.where(:status => 1).order("created_at DESC")
  end
end
