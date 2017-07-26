require 'test_helper'

class ClassificationFundsControllerTest < ActionController::TestCase
  setup do
    @classification_fund = classification_funds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classification_funds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classification_fund" do
    assert_difference('ClassificationFund.count') do
      post :create, classification_fund: {  }
    end

    assert_redirected_to classification_fund_path(assigns(:classification_fund))
  end

  test "should show classification_fund" do
    get :show, id: @classification_fund
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classification_fund
    assert_response :success
  end

  test "should update classification_fund" do
    patch :update, id: @classification_fund, classification_fund: {  }
    assert_redirected_to classification_fund_path(assigns(:classification_fund))
  end

  test "should destroy classification_fund" do
    assert_difference('ClassificationFund.count', -1) do
      delete :destroy, id: @classification_fund
    end

    assert_redirected_to classification_funds_path
  end
end
