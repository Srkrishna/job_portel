class EducationQualificationsController < ApplicationController
  before_action :set_education_qualification, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /education_qualifications
  # GET /education_qualifications.json
  def index
    if Member.find_by_user_id(current_user.id) != nil
      me=Member.find_by_user_id(current_user.id)
      @education_qualifications = EducationQualification.where(:member_id=>me.id)
    end
  end

  # GET /education_qualifications/1
  # GET /education_qualifications/1.json
  def show
  end

  # GET /education_qualifications/new
  def new
    @education_qualification = EducationQualification.new
  end

  # GET /education_qualifications/1/edit
  def edit
  end

  # POST /education_qualifications
  # POST /education_qualifications.json
  def create
    @education_qualification = EducationQualification.new(education_qualification_params)

    respond_to do |format|
      if @education_qualification.save
        @education_qualification.update_attributes(:member_id=> params[:education_qualification][:member_id])
        format.html { redirect_to '/members', notice: 'Education qualification was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @education_qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /education_qualifications/1
  # PATCH/PUT /education_qualifications/1.json
  def update
    respond_to do |format|
      if @education_qualification.update(education_qualification_params)
        @education_qualification.update_attributes(:member_id=> params[:education_qualification][:member_id])
        format.html { redirect_to '/members', notice: 'Education qualification was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @education_qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /education_qualifications/1
  # DELETE /education_qualifications/1.json
  def destroy
    @education_qualification.destroy
    respond_to do |format|
      format.html { redirect_to education_qualifications_url, notice: 'Education qualification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education_qualification
      @education_qualification = EducationQualification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_qualification_params
      params.require(:education_qualification).permit(:user_id, :intitution_name, :passed_out, :percentage)
    end
end
