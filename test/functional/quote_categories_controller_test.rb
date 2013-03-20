require 'test_helper'

class QuoteCategoriesControllerTest < ActionController::TestCase
  setup do
    @quote_category = quote_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quote_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote_category" do
    assert_difference('QuoteCategory.count') do
      post :create, quote_category: { title: @quote_category.title }
    end

    assert_redirected_to quote_category_path(assigns(:quote_category))
  end

  test "should show quote_category" do
    get :show, id: @quote_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote_category
    assert_response :success
  end

  test "should update quote_category" do
    put :update, id: @quote_category, quote_category: { title: @quote_category.title }
    assert_redirected_to quote_category_path(assigns(:quote_category))
  end

  test "should destroy quote_category" do
    assert_difference('QuoteCategory.count', -1) do
      delete :destroy, id: @quote_category
    end

    assert_redirected_to quote_categories_path
  end
end
