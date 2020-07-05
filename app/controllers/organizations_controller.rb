class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.joins(members: :user).where("users.id=#{current_person.id}")

  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @members =  Member.joins(:user).where("members.organization_id= #{params[:id]}")
    @events1 = Event.where("organization_id = #{params[:id]} and private = 0")
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
      @member = Member.create(user: current_person, organization: @organization, is_admin_org:true)
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @members= Member.where(organization_id: @organization.id)
    @members.each do |member|
      member.destroy
    end

    @organization.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.fetch(:organization, {}).permit(:name, :image, :rich_text, :description,
                                             videos: [], documents: [], pictures: [],
                                             users_attributes: [:username, :email, :password,
                                                                 :in_blacklist],
                                              homepage_attributes: [:organization_id, :event_id],
                                             members_attributes: [:id,:user_id, :_destroy])
    end
end
