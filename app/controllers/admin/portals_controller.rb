class Admin::PortalsController < ApplicationController
  before_filter :authenticate
  before_action :set_portal, only: [:edit, :update, :destroy]

  # GET /portals
  # GET /portals.json
  def index
    @portals = Portal.all.order(:category_id)
    @portal = Portal.new
    @categories = Category.find(Portal.uniq.pluck(:category_id))
  end

  # GET /portals/new
  def new
    @portal = Portal.new
  end

  # GET /portals/1/edit
  def edit
  end

  # POST /portals
  # POST /portals.json
  def create
    @portal = Portal.new(portal_params)

    respond_to do |format|
      if @portal.save
        format.html { redirect_to admin_portals_url, success: 'Le portail a été créé avec succès.' }
        format.json { render :show, status: :created, location: [:admin,@portal] }
      else
        format.html { render :new }
        format.json { render json: @portal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portals/1
  # PATCH/PUT /portals/1.json
  def update
    respond_to do |format|
      if @portal.update(portal_params)
        format.html { redirect_to admin_portals_url, warning: 'Le portail a été modifié avec succès.' }
        format.json { render :show, status: :ok, location: [:admin,@portal] }
      else
        format.html { render :edit }
        format.json { render json: @portal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portals/1
  # DELETE /portals/1.json
  def destroy
    @portal.destroy
    respond_to do |format|
      format.html { redirect_to admin_portals_url, danger: 'Le portail a été supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  # FILTER /from_category
  # FILTER /from_category.js
  def from_category
    if(params[:categ] == nil)
      @portals = Portal.all
    else
      @portals = Portal.where(:category_id => params[:categ])
    end
    respond_to do |format|
        format.js
    end
  end

  protected
    # Authentication to admin part
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == 'laine' && password == 'TITEUFCYRIL'
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portal
      @portal = Portal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portal_params
      params.require(:portal).permit(:image, :category_id)
    end
end
