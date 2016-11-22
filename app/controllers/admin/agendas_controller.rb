class Admin::AgendasController < ApplicationController
  before_filter :authenticate
  before_action :set_agenda, only: [:edit, :update, :destroy]

  # GET /agendas
  # GET /agendas.json
  def index
    @agendas = Agenda.all
  end

  # GET /agendas/new
  def new
    @agenda = Agenda.new
  end

  # GET /agendas/1/edit
  def edit
  end

  # POST /agendas
  # POST /agendas.json
  def create
    @agenda = Agenda.new(agenda_params)

    respond_to do |format|
      if @agenda.save
        format.html { redirect_to admin_agendas_url, success: 'La note a été créée avec succès.' }
        format.json { render :show, status: :created, location: [:admin,@agenda] }
      else
        format.html { render :new }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendas/1
  # PATCH/PUT /agendas/1.json
  def update
    respond_to do |format|
      if @agenda.update(agenda_params)
        format.html { redirect_to admin_agendas_url, notice: 'La note a été mise à jour avec succès.' }
        format.json { render :show, status: :ok, location: [:admin,@agenda] }
      else
        format.html { render :edit }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.json
  def destroy
    @agenda.destroy
    respond_to do |format|
      format.html { redirect_to admin_agendas_url, notice: 'La note a été supprimée avec succès.' }
      format.json { head :no_content }
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
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agenda_params
      params.require(:agenda).permit(:title, :content, :startdate, :enddate)
    end
end
