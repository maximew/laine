class GaragesController < ApplicationController

  def index
    @garages = Garage.all
    @garage = Garage.new
    @categories = Category.find(Garage.uniq.pluck(:category_id))
  end

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
end
