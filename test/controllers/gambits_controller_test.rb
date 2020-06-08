require 'test_helper'

class GambitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gambit = gambits(:one)
  end

  test "should get index" do
    get gambits_url
    assert_response :success
  end

  test "should get new" do
    get new_gambit_url
    assert_response :success
  end

  test "should create gambit" do
    assert_difference('Gambit.count') do
      post gambits_url, params: { gambit: {  } }
    end

    assert_redirected_to gambit_url(Gambit.last)
  end

  test "should show gambit" do
    get gambit_url(@gambit)
    assert_response :success
  end

  test "should get edit" do
    get edit_gambit_url(@gambit)
    assert_response :success
  end

  test "should update gambit" do
    patch gambit_url(@gambit), params: { gambit: {  } }
    assert_redirected_to gambit_url(@gambit)
  end

  test "should destroy gambit" do
    assert_difference('Gambit.count', -1) do
      delete gambit_url(@gambit)
    end

    assert_redirected_to gambits_url
  end
end
