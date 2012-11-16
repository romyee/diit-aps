class ApplicationFormsController < ApplicationController
  before_filter :confirm_login
  layout :specified_layout
  
  # GET /application_forms
  # GET /application_forms.json
  def index
    redirect_to  :controller => "member_zone", :action => "forms"
    #@forms = Form.all

    #respond_to do |format|
    #  format.html # index.html.erb
    # format.json { render json: @application_forms }
    #end
  end

  # GET /application_forms/1
  # GET /application_forms/1.json
  def show
    @application_form = ApplicationForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application_form }
    end
  end

  # GET /application_forms/new
  # GET /application_forms/new.json
  def new
    @application_form = ApplicationForm.new
    @fields = Form.find(params[:i]).form_fields

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application_form }
    end
  end

  def apply
    @application_form = ApplicationForm.new
    @from = Form.find_by_id(params[:id])
    if @from
      @fields = @from.form_fields

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @application_form }
      end
    else
      redirect_to :action => "index"
    end

  end

  # GET /application_forms/1/edit
  def edit
    @application_form = ApplicationForm.find(params[:id])
  end

  # POST /application_forms
  # POST /application_forms.json
  def create
    @application_form = ApplicationForm.new(params[:application_form])

    respond_to do |format|
      if @application_form.save
        format.html { redirect_to @application_form, notice: 'Application form was successfully created.' }
        format.json { render json: @application_form, status: :created, location: @application_form }
      else
        format.html { render action: "new" }
        format.json { render json: @application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /application_forms/1
  # PUT /application_forms/1.json
  def update
    @application_form = ApplicationForm.find(params[:id])

    respond_to do |format|
      if @application_form.update_attributes(params[:application_form])
        format.html { redirect_to @application_form, notice: 'Application form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_forms/1
  # DELETE /application_forms/1.json
  def destroy
    @application_form = ApplicationForm.find(params[:id])
    @application_form.destroy

    respond_to do |format|
      format.html { redirect_to application_forms_url }
      format.json { head :no_content }
    end
  end
end
