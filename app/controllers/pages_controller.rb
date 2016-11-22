class PagesController < ApplicationController
  def home
  	@agendas = Agenda.all
  end

  def contact
  end
end
