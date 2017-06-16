require 'test_helper'

class CvFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cv_file = cv_files(:one)
  end

  test "should get index" do
    get cv_files_url
    assert_response :success
  end

  test "should get new" do
    get new_cv_file_url
    assert_response :success
  end

  test "should create cv_file" do
    assert_difference('CvFile.count') do
      post cv_files_url, params: { cv_file: { application_id: @cv_file.application_id, name: @cv_file.name } }
    end

    assert_redirected_to cv_file_url(CvFile.last)
  end

  test "should show cv_file" do
    get cv_file_url(@cv_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_cv_file_url(@cv_file)
    assert_response :success
  end

  test "should update cv_file" do
    patch cv_file_url(@cv_file), params: { cv_file: { application_id: @cv_file.application_id, name: @cv_file.name } }
    assert_redirected_to cv_file_url(@cv_file)
  end

  test "should destroy cv_file" do
    assert_difference('CvFile.count', -1) do
      delete cv_file_url(@cv_file)
    end

    assert_redirected_to cv_files_url
  end
end
