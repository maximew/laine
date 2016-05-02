class StoresController < ApplicationController

  def index
    @stores = Store.all
    @store = Store.new
    @categories = Category.find(Store.uniq.pluck(:category_id))
  end

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
end
