class WindowsController < ApplicationController

  def index
    @windows = Window.all
    @window = Window.new
    @categories = Category.find(Window.uniq.pluck(:category_id))
  end

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
end
