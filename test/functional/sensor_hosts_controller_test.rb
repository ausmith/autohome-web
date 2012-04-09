require 'test_helper'

class SensorHostsControllerTest < ActionController::TestCase
  setup do
    @sensor_host = sensor_hosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sensor_hosts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sensor_host" do
    assert_difference('SensorHost.count') do
      post :create, :sensor_host => @sensor_host.attributes
    end

    assert_redirected_to sensor_host_path(assigns(:sensor_host))
  end

  test "should show sensor_host" do
    get :show, :id => @sensor_host.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sensor_host.to_param
    assert_response :success
  end

  test "should update sensor_host" do
    put :update, :id => @sensor_host.to_param, :sensor_host => @sensor_host.attributes
    assert_redirected_to sensor_host_path(assigns(:sensor_host))
  end

  test "should destroy sensor_host" do
    assert_difference('SensorHost.count', -1) do
      delete :destroy, :id => @sensor_host.to_param
    end

    assert_redirected_to sensor_hosts_path
  end
end
