class ShuttersController < ApplicationController

  def index
    @shutters = Shutter.all
    @shutter = Shutter.new
    @categories = Category.find(Shutter.uniq.pluck(:category_id))
  end

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
end
