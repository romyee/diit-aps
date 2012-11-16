class ApplicationFormFieldsController < ApplicationController
  before_filter :confirm_login
  layout :specified_layout
  
  # GET /application_form_fields
  # GET /application_form_fields.json
  def index
    @application_form_fields = ApplicationFormField.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @application_form_fields }
    end
  end

  # GET /application_form_fields/1
  # GET /application_form_fields/1.json
  def show
    @application_form_field = ApplicationFormField.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application_form_field }
    end
  end

  # GET /application_form_fields/new
  # GET /application_form_fields/new.json
  def new
    @application_form_field = ApplicationFormField.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application_form_field }
    end
  end

  # GET /application_form_fields/1/edit
  def edit
    @application_form_field = ApplicationFormField.find(params[:id])
  end

  # POST /application_form_fields
  # POST /application_form_fields.json
  def create
    @application_form_field = ApplicationFormField.new(params[:application_form_field])

    respond_to do |format|
      if @application_form_field.save
        format.html { redirect_to @application_form_field, notice: 'Application form field was successfully created.' }
        format.json { render json: @application_form_field, status: :created, location: @application_form_field }
      else
        format.html { render action: "new" }
        format.json { render json: @application_form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /application_form_fields/1
  # PUT /application_form_fields/1.json
  def update
    @application_form_field = ApplicationFormField.find(params[:id])

    respond_to do |format|
      if @application_form_field.update_attributes(params[:application_form_field])
        format.html { redirect_to @application_form_field, notice: 'Application form field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application_form_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_form_fields/1
  # DELETE /application_form_fields/1.json
  def destroy
    @application_form_field = ApplicationFormField.find(params[:id])
    @application_form_field.destroy

    respond_to do |format|
      format.html { redirect_to application_form_fields_url }
      format.json { head :no_content }
    end
  end
end
