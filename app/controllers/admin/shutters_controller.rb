class Admin::ShuttersController < ApplicationController
  before_filter :authenticate
  before_action :set_shutter, only: [:edit, :update, :destroy]

  # GET /shutters
  # GET /shutters.json
  def index
    @shutters = Shutter.all.order(:category_id)
    @shutter = Shutter.new
    @categories = Category.find(Shutter.uniq.pluck(:category_id))
  end

  # GET /shutters/new
  def new
    @shutter = Shutter.new
  end

  # GET /shutters/1/edit
  def edit
  end

  # POST /shutters
  # POST /shutters.json
  def create
    @shutter = Shutter.new(shutter_params)

    respond_to do |format|
      if @shutter.save
        format.html { redirect_to admin_shutters_url, success: 'Le volet a été créé avec succès.' }
        format.json { render :show, status: :created, location: [:admin,@shutter] }
      else
        format.html { render :new }
        format.json { render json: @shutter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shutters/1
  # PATCH/PUT /shutters/1.json
  def update
    respond_to do |format|
      if @shutter.update(shutter_params)
        format.html { redirect_to admin_shutters_url, warning: 'Le volet a été modifié avec succès.' }
        format.json { render :show, status: :ok, location: [:admin,@shutter] }
      else
        format.html { render :edit }
        format.json { render json: @shutter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shutters/1
  # DELETE /shutters/1.json
  def destroy
    @shutter.destroy
    respond_to do |format|
      format.html { redirect_to admin_shutters_url, danger: 'Le volet a été supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  # FILTER /from_category
  # FILTER /from_category.js
  def from_category
    if(params[:categ] == nil)
      @shutters = Shutter.all
    else
      @shutters = Shutter.where(:category_id => params[:categ])
    end
    respond_to do |format|
        format.js
    end
  end

  protected
    # Authentication to admin part
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shutter
      @shutter = Shutter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shutter_params
      params.require(:shutter).permit(:image, :category_id)
    end
end
