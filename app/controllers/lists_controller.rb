class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @tasks = Task.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List saved successfully!"
      respond_to do |format|
        format.html { redirect_to lists_path }
        format.js
      end
    else
      flash[:alert] = "Sorry, couldn't save."
      render :new
    end
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end
end
