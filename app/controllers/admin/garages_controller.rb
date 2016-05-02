class Admin::GaragesController < ApplicationController
  before_action :set_garage, only: [:edit, :update, :destroy]

  # GET /garages
  # GET /garages.json
  def index
    @garages = Garage.all.order(:category_id)
    @garage = Garage.new
    @categories = Category.find(Garage.uniq.pluck(:category_id))
  end

  # GET /garages/new
  def new
    @garage = Garage.new
  end

  # GET /garages/1/edit
  def edit
  end

  # POST /garages
  # POST /garages.json
  def create
    @garage = Garage.new(garage_params)

    respond_to do |format|
      if @garage.save
        format.html { redirect_to admin_garages_url, success: 'La porte a été créée avec succès.' }
        format.json { render :show, status: :created, location: [:admin,@garage] }
      else
        format.html { render :new }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garages/1
  # PATCH/PUT /garages/1.json
  def update
    respond_to do |format|
      if @garage.update(garage_params)
        format.html { redirect_to admin_garages_url, warning: 'La porte a été modifiée avec succès.' }
        format.json { render :show, status: :ok, location: [:admin,@garage] }
      else
        format.html { render :edit }
        format.json { render json: @garage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garages/1
  # DELETE /garages/1.json
  def destroy
    @garage.destroy
    respond_to do |format|
      format.html { redirect_to admin_garages_url, danger: 'La porte a été supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  # FILTER /from_category
  # FILTER /from_category.js
  def from_category
    if(params[:categ] == nil)
      @garages = Garage.all
    else
      @garages = Garage.where(:category_id => params[:categ])
    end
    respond_to do |format|
        format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garage
      @garage = Garage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garage_params
      params.require(:garage).permit(:image, :category_id)
    end
end
