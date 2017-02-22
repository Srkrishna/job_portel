class CompanyDetailsController < ApplicationController
  before_action :set_company_detail, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /company_details
  # GET /company_details.json

  def index
    if Member.find_by_user_id(current_user.id) != nil
      me=Member.find_by_user_id(current_user.id)
      @company_details = CompanyDetail.where(:member_id=>me.id)
      @requested_job = RequestedJobs.where(:company_id => @company_details.id , :emp_id=> me.id)
    else
      redirect_to "/members/new"
    end
  end

  # GET /company_details/1
  # GET /company_details/1.json
  def show
  end

  # GET /company_details/new
  def new
    if Member.find_by_user_id(current_user.id) != nil
      me=Member.find_by_user_id(current_user.id)
      @company_detail = CompanyDetail.new
    else
      redirect_to "/members/new"
    end
  end

  # GET /company_details/1/edit
  def edit
  end

  # POST /company_details
  # POST /company_details.json
  def create
    @company_detail = CompanyDetail.new(company_detail_params)

    respond_to do |format|
      if @company_detail.save
        @company_detail.update_attributes(:member_id=> params[:company_detail][:member_id])
        format.html { redirect_to '/company_details', notice: 'Company detail was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @company_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_details/1
  # PATCH/PUT /company_details/1.json
  def update
    respond_to do |format|
      if @company_detail.update(company_detail_params)
        format.html { redirect_to '/company_details', notice: 'Company detail was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @company_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_details/1
  # DELETE /company_details/1.json
  def destroy
    @company_detail.destroy
    respond_to do |format|
      format.html { redirect_to company_details_url, notice: 'Company detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_detail
      @company_detail = CompanyDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_detail_params
      params.require(:company_detail).permit(:name, :address, :keyword, :description, :url)
    end
end
