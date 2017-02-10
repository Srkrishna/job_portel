require 'test_helper'

class EducationQualificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @education_qualification = education_qualifications(:one)
  end

  test "should get index" do
    get education_qualifications_url
    assert_response :success
  end

  test "should get new" do
    get new_education_qualification_url
    assert_response :success
  end

  test "should create education_qualification" do
    assert_difference('EducationQualification.count') do
      post education_qualifications_url, params: { education_qualification: { intitution_name: @education_qualification.intitution_name, passed_out: @education_qualification.passed_out, percentage: @education_qualification.percentage, user_id: @education_qualification.user_id } }
    end

    assert_redirected_to education_qualification_url(EducationQualification.last)
  end

  test "should show education_qualification" do
    get education_qualification_url(@education_qualification)
    assert_response :success
  end

  test "should get edit" do
    get edit_education_qualification_url(@education_qualification)
    assert_response :success
  end

  test "should update education_qualification" do
    patch education_qualification_url(@education_qualification), params: { education_qualification: { intitution_name: @education_qualification.intitution_name, passed_out: @education_qualification.passed_out, percentage: @education_qualification.percentage, user_id: @education_qualification.user_id } }
    assert_redirected_to education_qualification_url(@education_qualification)
  end

  test "should destroy education_qualification" do
    assert_difference('EducationQualification.count', -1) do
      delete education_qualification_url(@education_qualification)
    end

    assert_redirected_to education_qualifications_url
  end
end
