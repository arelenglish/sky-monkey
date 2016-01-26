require 'test_helper'

class BoardingPassesControllerTest < ActionController::TestCase
  setup do
    @boarding_pass = boarding_passes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boarding_passes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boarding_pass" do
    assert_difference('BoardingPass.count') do
      post :create, boarding_pass: { expiration: @boarding_pass.expiration, is_valid: @boarding_pass.is_valid, price: @boarding_pass.price, quantity: @boarding_pass.quantity, tax_paid: @boarding_pass.tax_paid }
    end

    assert_redirected_to boarding_pass_path(assigns(:boarding_pass))
  end

  test "should show boarding_pass" do
    get :show, id: @boarding_pass
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boarding_pass
    assert_response :success
  end

  test "should update boarding_pass" do
    patch :update, id: @boarding_pass, boarding_pass: { expiration: @boarding_pass.expiration, is_valid: @boarding_pass.is_valid, price: @boarding_pass.price, quantity: @boarding_pass.quantity, tax_paid: @boarding_pass.tax_paid }
    assert_redirected_to boarding_pass_path(assigns(:boarding_pass))
  end

  test "should destroy boarding_pass" do
    assert_difference('BoardingPass.count', -1) do
      delete :destroy, id: @boarding_pass
    end

    assert_redirected_to boarding_passes_path
  end
end
