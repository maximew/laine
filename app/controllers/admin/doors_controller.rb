class Admin::DoorsController < ApplicationController
  before_action :set_door, only: [:edit, :update, :destroy]

  # GET /doors
  # GET /doors.json
  def index
    @doors = Door.all.order(:category_id)
    @door = Door.new
    @categories = Category.find(Door.uniq.pluck(:category_id))
  end

  # GET /doors/new
  def new
    @door = Door.new
  end

  # GET /doors/1/edit
  def edit
  end

  # POST /doors
  # POST /doors.json
  def create
    @door = Door.new(door_params)

    respond_to do |format|
      if @door.save
        format.html { redirect_to admin_doors_url, success: 'La porte a été créée avec succès.' }
        format.json { render :show, status: :created, location: [:admin,@door] }
      else
        format.html { render :new }
        format.json { render json: @door.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doors/1
  # PATCH/PUT /doors/1.json
  def update
    respond_to do |format|
      if @door.update(door_params)
        format.html { redirect_to admin_doors_url, warning: 'La porte a été modifiée avec succès.' }
        format.json { render :show, status: :ok, location: [:admin,@door] }
      else
        format.html { render :edit }
        format.json { render json: @door.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doors/1
  # DELETE /doors/1.json
  def destroy
    @door.destroy
    respond_to do |format|
      format.html { redirect_to admin_doors_url, danger: 'La porte a été supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  # FILTER /from_category
  # FILTER /from_category.js
  def from_category
    if(params[:categ] == nil)
      @doors = Door.all
    else
      @doors = Door.where(:category_id => params[:categ])
    end
    respond_to do |format|
        format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_door
      @door = Door.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def door_params
      params.require(:door).permit(:image, :category_id)
    end
end
