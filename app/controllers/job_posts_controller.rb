class JobPostsController < ApplicationController
  before_action :set_job_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /job_posts
  # GET /job_posts.json
  def index
    @job_posts = JobPost.all
  end

  # GET /job_posts/1
  # GET /job_posts/1.json
  def show
  end

  # GET /job_posts/new
  def new
    tmp = Member.find_by_user_id(current_user.id)
    if tmp != nil
      if CompanyDetail.find_by_member_id(tmp.id) != nil
        @job_post = JobPost.new
        @company=CompanyDetail.all
      else
        redirect_to "/company_details/new"
      end
    else
      redirect_to "/company_details/new"
    end
  end

  # GET /job_posts/1/edit
  def edit
    @company=CompanyDetail.all
  end

  # POST /job_posts
  # POST /job_posts.json
  def create
    @job_post = JobPost.new(job_post_params)

    respond_to do |format|
      if @job_post.save
        format.html { redirect_to '/company_details', notice: 'Job post was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_posts/1
  # PATCH/PUT /job_posts/1.json
  def update
    respond_to do |format|
      if @job_post.update(job_post_params)
        format.html { redirect_to '/company_details', notice: 'Job post was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_posts/1
  # DELETE /job_posts/1.json
  def destroy
    @job_post.destroy
    respond_to do |format|
      format.html { redirect_to job_posts_url, notice: 'Job post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_post
      @job_post = JobPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_post_params
      params.require(:job_post).permit(:company_id, :required_on, :etc, :description)
    end
end
