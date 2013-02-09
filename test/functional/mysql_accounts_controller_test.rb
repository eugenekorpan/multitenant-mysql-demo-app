require 'test_helper'

class MysqlAccountsControllerTest < ActionController::TestCase
  setup do
    @mysql_account = mysql_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mysql_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mysql_account" do
    assert_difference('MysqlAccount.count') do
      post :create, mysql_account: { name: @mysql_account.name }
    end

    assert_redirected_to mysql_account_path(assigns(:mysql_account))
  end

  test "should show mysql_account" do
    get :show, id: @mysql_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mysql_account
    assert_response :success
  end

  test "should update mysql_account" do
    put :update, id: @mysql_account, mysql_account: { name: @mysql_account.name }
    assert_redirected_to mysql_account_path(assigns(:mysql_account))
  end

  test "should destroy mysql_account" do
    assert_difference('MysqlAccount.count', -1) do
      delete :destroy, id: @mysql_account
    end

    assert_redirected_to mysql_accounts_path
  end
end
