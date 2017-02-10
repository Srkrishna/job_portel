class HomeController < ApplicationController

  def index
    @job_posts=JobPost.all
    @company_details=CompanyDetail.all
  end

  def create
    member=Member.find_by_user_id(current_user.id)
    tmp=RequestedJob.create(emp_id: member.id,company_id: params[:company_id],job_id: params[:job_id])
    flash[:notice]="Job has been applied successfully"
    redirect_to root_path
  end

end
