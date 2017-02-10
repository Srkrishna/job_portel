require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post members_url, params: { member: { address1: @member.address1, address2: @member.address2, description: @member.description, email: @member.email, father_name: @member.father_name, links: @member.links, locations: @member.locations, name: @member.name, phone: @member.phone, photo: @member.photo, resume: @member.resume, role: @member.role } }
    end

    assert_redirected_to member_url(Member.last)
  end

  test "should show member" do
    get member_url(@member)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_url(@member)
    assert_response :success
  end

  test "should update member" do
    patch member_url(@member), params: { member: { address1: @member.address1, address2: @member.address2, description: @member.description, email: @member.email, father_name: @member.father_name, links: @member.links, locations: @member.locations, name: @member.name, phone: @member.phone, photo: @member.photo, resume: @member.resume, role: @member.role } }
    assert_redirected_to member_url(@member)
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete member_url(@member)
    end

    assert_redirected_to members_url
  end
end
