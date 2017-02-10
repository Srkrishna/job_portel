require 'test_helper'

class RequestedJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requested_job = requested_jobs(:one)
  end

  test "should get index" do
    get requested_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_requested_job_url
    assert_response :success
  end

  test "should create requested_job" do
    assert_difference('RequestedJob.count') do
      post requested_jobs_url, params: { requested_job: { emp_id: @requested_job.emp_id, job_id: @requested_job.job_id } }
    end

    assert_redirected_to requested_job_url(RequestedJob.last)
  end

  test "should show requested_job" do
    get requested_job_url(@requested_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_requested_job_url(@requested_job)
    assert_response :success
  end

  test "should update requested_job" do
    patch requested_job_url(@requested_job), params: { requested_job: { emp_id: @requested_job.emp_id, job_id: @requested_job.job_id } }
    assert_redirected_to requested_job_url(@requested_job)
  end

  test "should destroy requested_job" do
    assert_difference('RequestedJob.count', -1) do
      delete requested_job_url(@requested_job)
    end

    assert_redirected_to requested_jobs_url
  end
end
