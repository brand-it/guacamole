require 'test_helper'

class ManasControllerTest < ActionController::TestCase
    
  test "should create mana" do
    authorize_as :quentin
    assert_difference('Mana.count') do
      post :create, :mana => { :color => 2, :card_id => cards(:one)}
    end
    #assert_response :redirect
  end

  test "should get access denied on edit" do
    get :edit, :id => manas(:one).id
    assert_response 302
    assert_redirected_to new_session_path
  end

  test 

  test "should get edit" do
    authorize_as :quentin
    get :edit, :id => manas(:one).id
    assert_response :success
  end

  test "should update mana" do
    authorize_as :quentin
    put :update, :id => manas(:one).id, :mana => { :color => 2 }
    assert_redirected_to card_path(assigns(:mana))
  end

  test "should destroy mana" do
    authorize_as :quentin
    assert_difference('Mana.count', -1) do
      delete :destroy, :id => manas(:one).id
    end

    assert_redirected_to card_path
  end
end
