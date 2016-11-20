class Admin::CategoriesController < ApplicationController
  before_filter :authenticate
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_url, success: 'La catégorie a été créée avec succès.' }
        format.json { render :show, status: :created, location: [:admin,@category] }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_url, warning: 'La catégorie a été mise à jour avec succès.' }
        format.json { render :show, status: :ok, location: [:admin,@category] }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    if @category.errors.count > 0
      respond_to do |format|
        format.html { redirect_to admin_categories_url, danger: 'Cette catégorie contient des dépendences. Impossible de la supprimer.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_categories_url, danger: 'La catégorie a été supprimée avec succès.' }
        format.json { head :no_content }
      end
    end
  end

  def to_label
    "#{libelle}"
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
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:libelle)
    end
end
