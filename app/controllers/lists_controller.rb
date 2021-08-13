class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
    #  creates a new List (FAILED - 4)
    #   assigns a newly created list as @list (FAILED - 5)
    #   redirects to the created list (FAILED - 6)
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
