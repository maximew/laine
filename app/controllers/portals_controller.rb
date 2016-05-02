class PortalsController < ApplicationController

  def index
    @portals = Portal.all
    @portal = Portal.new
    @categories = Category.find(Portal.uniq.pluck(:category_id))
  end

  def from_category
    if(params[:categ] == nil)
      @portals = Portal.all
    else
      @portals = Portal.where(:category_id => params[:categ])
    end
    respond_to do |format|
        format.js
    end
  end
end
