class RequestedJobsController < ApplicationController
  before_action :set_requested_job, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /requested_jobs
  # GET /requested_jobs.json
  def index
    @requested_jobs = RequestedJob.all
  end

  # GET /requested_jobs/1
  # GET /requested_jobs/1.json
  def show
  end

  # GET /requested_jobs/new
  def new
    @requested_job = RequestedJob.new
  end

  # GET /requested_jobs/1/edit
  def edit
  end

  # POST /requested_jobs
  # POST /requested_jobs.json
  def create
    @requested_job = RequestedJob.new(params[:requested_job])

    respond_to do |format|
      if @requested_job.save
        format.html { redirect_to @requested_job, notice: 'Requested job was successfully created.' }
        format.json { render :show, status: :created, location: @requested_job }
      else
        format.html { render :new }
        format.json { render json: @requested_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requested_jobs/1
  # PATCH/PUT /requested_jobs/1.json
  def update
    respond_to do |format|
      if @requested_job.update(requested_job_params)
        format.html { redirect_to @requested_job, notice: 'Requested job was successfully updated.' }
        format.json { render :show, status: :ok, location: @requested_job }
      else
        format.html { render :edit }
        format.json { render json: @requested_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requested_jobs/1
  # DELETE /requested_jobs/1.json
  def destroy
    @requested_job.destroy
    respond_to do |format|
      format.html { redirect_to requested_jobs_url, notice: 'Requested job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requested_job
      @requested_job = RequestedJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requested_job_params
      params.require(:requested_job).permit(:emp_id, :job_id)
    end
end
