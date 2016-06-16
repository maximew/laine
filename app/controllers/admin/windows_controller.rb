class Admin::WindowsController < ApplicationController
  before_filter :authenticate
  before_action :set_window, only: [:edit, :update, :destroy]

  # GET /windows
  # GET /windows.json
  def index
    @windows = Window.all.order(:category_id)
    @window = Window.new
    @categories = Category.find(Window.uniq.pluck(:category_id))
  end

  # GET /windows/new
  def new
    @window = Window.new
  end

  # GET /windows/1/edit
  def edit
  end

  # POST /windows
  # POST /windows.json
  def create
    @window = Window.new(window_params)

    respond_to do |format|
      if @window.save
        format.html { redirect_to admin_windows_url, success: 'La fenêtre a été créée avec succès.' }
        format.json { render :show, status: :created, location: [:admin,@window] }
      else
        format.html { render :new }
        format.json { render json: @window.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /windows/1
  # PATCH/PUT /windows/1.json
  def update
    respond_to do |format|
      if @window.update(window_params)
        format.html { redirect_to admin_windows_url, warning: 'La fenêtre a été modifiée avec succès.' }
        format.json { render :show, status: :ok, location: [:admin,@window] }
      else
        format.html { render :edit }
        format.json { render json: @window.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /windows/1
  # DELETE /windows/1.json
  def destroy
    @window.destroy
    respond_to do |format|
      format.html { redirect_to admin_windows_url, danger: 'La fenêtre a été supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  # FILTER /from_category
  # FILTER /from_category.js
  def from_category
    if(params[:categ] == nil)
      @windows = Window.all
    else
      @windows = Window.where(:category_id => params[:categ])
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
    def set_window
      @window = Window.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def window_params
      params.require(:window).permit(:image,:category_id)
    end
end
