class Admin::StoresController < ApplicationController
  before_action :set_store, only: [:edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all.order(:category_id)
    @store = Store.new
    @categories = Category.find(Store.uniq.pluck(:category_id))
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to admin_stores_url, success: 'Le store a été créé avec succès.' }
        format.json { render :show, status: :created, location: [:admin,@store] }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to admin_stores_url, warning: 'Le store a été modifié avec succès.' }
        format.json { render :show, status: :ok, location: [:admin,@store] }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to admin_stores_url, danger: 'Le store a été supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  # FILTER /from_category
  # FILTER /from_category.js
  def from_category
    if(params[:categ] == nil)
      @stores = Store.all
    else
      @stores = Store.where(:category_id => params[:categ])
    end
    respond_to do |format|
        format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:image, :category_id)
    end
end
