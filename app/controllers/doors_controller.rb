class DoorsController < ApplicationController

  def index
    @doors = Door.all
    @door = Door.new
    @categories = Category.find(Door.uniq.pluck(:category_id))
  end

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
end
