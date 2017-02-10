class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /members
  # GET /members.json
  def index
    if Member.find_by_user_id(current_user.id) != nil
      me=Member.find_by_user_id(current_user.id)
      @members = Member.all
      @education_qualifications = EducationQualification.where(:member_id=>me.id)
      @experiences = Experience.where(:member_id=>me.id)
    else
      redirect_to "/members/new"
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    tmp=Member.find_by_user_id(current_user.id)
    if tmp != nil
      flash[:notice]="You already have a account"
      redirect_to "/members"
    else
      @member = Member.new
    end
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    respond_to do |format|
      if @member.save
        @member.update_attributes(:user_id => current_user.id)
        format.html { redirect_to '/members', notice: 'Member was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to '/members', notice: 'Member was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :address1, :address2, :phone, :email, :photo, :role, :resume, :locations, :links, :description, :father_name)
    end
end
