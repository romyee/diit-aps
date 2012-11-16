class ApplicationProcessesController < ApplicationController
  before_filter :confirm_login
  layout :specified_layout
  # GET /application_processes
  # GET /application_processes.json
  def index
    @application_processes = ApplicationProcess.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @application_processes }
    end
  end

  # GET /application_processes/1
  # GET /application_processes/1.json
  def show
    @application_process = ApplicationProcess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application_process }
    end
  end

  # GET /application_processes/new
  # GET /application_processes/new.json
  def new
    @application_process = ApplicationProcess.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application_process }
    end
  end
  
  def reject
    @application = ApplicationForm.find(params[:id])
    @application_process = ApplicationProcess.new(:application_form_id => params[:id], :refferer_id => session[:user_id], :status => 111, :reffer_to_id => @application.user_id, :last_process_id => params[:pid])
  end
  
  def approve
    @application = ApplicationForm.find(params[:id])
    @application_process = ApplicationProcess.new(:application_form_id => params[:id], :refferer_id => session[:user_id], :status => 10, :reffer_to_id => @application.user_id, :last_process_id => params[:pid])
  end
  
  def forward
    @application = ApplicationForm.find(params[:id])
    @application_process = ApplicationProcess.new(:application_form_id => params[:id], :refferer_id => session[:user_id], :last_process_id => params[:pid])
  end

  # GET /application_processes/1/edit
  def edit
    @application_process = ApplicationProcess.find(params[:id])
  end

  # POST /application_processes
  # POST /application_processes.json
  def create
    @application_process = ApplicationProcess.new(params[:application_process])
    last_process_id = params[:application_process][:last_process_id]
    unless last_process_id.blank?
      last_process = ApplicationProcess.find(last_process_id)
      if last_process
        last_process.update_attributes(:status => 5)
      end
    end

    respond_to do |format|
      if @application_process.save
        format.html { redirect_to @application_process, notice: "Application process was successfully created." }
        format.json { render json: @application_process, status: :created, location: @application_process }
      else
        format.html { render action: "new" }
        format.json { render json: @application_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /application_processes/1
  # PUT /application_processes/1.json
  def update
    @application_process = ApplicationProcess.find(params[:id])

    respond_to do |format|
      if @application_process.update_attributes(params[:application_process])
        format.html { redirect_to @application_process, notice: 'Application process was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_processes/1
  # DELETE /application_processes/1.json
  def destroy
    @application_process = ApplicationProcess.find(params[:id])
    @application_process.destroy

    respond_to do |format|
      format.html { redirect_to application_processes_url }
      format.json { head :no_content }
    end
  end
end
