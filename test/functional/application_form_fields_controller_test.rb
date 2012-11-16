require 'test_helper'

class ApplicationFormFieldsControllerTest < ActionController::TestCase
  setup do
    @application_form_field = application_form_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_form_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_form_field" do
    assert_difference('ApplicationFormField.count') do
      post :create, application_form_field: { field_answer: @application_form_field.field_answer }
    end

    assert_redirected_to application_form_field_path(assigns(:application_form_field))
  end

  test "should show application_form_field" do
    get :show, id: @application_form_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application_form_field
    assert_response :success
  end

  test "should update application_form_field" do
    put :update, id: @application_form_field, application_form_field: { field_answer: @application_form_field.field_answer }
    assert_redirected_to application_form_field_path(assigns(:application_form_field))
  end

  test "should destroy application_form_field" do
    assert_difference('ApplicationFormField.count', -1) do
      delete :destroy, id: @application_form_field
    end

    assert_redirected_to application_form_fields_path
  end
end
