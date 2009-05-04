require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  
  def test_should_get_search
    post :search, {:card => {:search => cards(:one).name}}
    assert_response :success
  end
  
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  def test_should_get_new_access_denied
    get :new
    assert_redirected_to new_session_path
  end
  
  def test_should_get_new
    authorize_as :quentin
    get :new
    assert_response :success
  end

  def test_should_get_create_access_denied
    assert_difference('Card.count', 0) do
      post :create, :card => { :name => "String", :kind => "Name", :ablity => "It can fly" }
    end
    
    assert_redirected_to new_session_path
  end

  def test_should_show_cards
    get :show, :id => cards(:one).id
    assert_response :success
  end


  def test_should_get_edit
    authorize_as :quentin
    get :edit, :id => cards(:one).id
    assert_response :success
  end

  def test_should_update_access_denied
    put :update, :id => cards(:one).id, :card => { :name => "Kill there ass" }
    assert_redirected_to new_session_path
  end

  def test_should_update_cards
    authorize_as :quentin
    put :update, :id => cards(:one).id, :card => { :name => "Kill there ass" }
    assert_redirected_to card_path(assigns(:card))
  end

  def test_should_destroy_access_denied
    assert_difference('Card.count', 0) do
      delete :destroy, :id => cards(:one).id
    end

    assert_redirected_to new_session_path
  end

  def test_should_destroy_cards
    authorize_as :quentin
    assert_difference('Card.count', -1) do
      delete :destroy, :id => cards(:one).id
    end

    assert_redirected_to cards_path
  end
end
