require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { contact_number: @user.contact_number, email: @user.email, first_name: @user.first_name, hashed_password: @user.hashed_password, last_name: @user.last_name, official_id: @user.official_id, permanent_address: @user.permanent_address, present_addresss: @user.present_addresss, recover_hash: @user.recover_hash, role: @user.role, salt_key: @user.salt_key, status: @user.status }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { contact_number: @user.contact_number, email: @user.email, first_name: @user.first_name, hashed_password: @user.hashed_password, last_name: @user.last_name, official_id: @user.official_id, permanent_address: @user.permanent_address, present_addresss: @user.present_addresss, recover_hash: @user.recover_hash, role: @user.role, salt_key: @user.salt_key, status: @user.status }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
