class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new #new line

  end

  def new
    @list = List.new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    @bookmark = Bookmark.new #new line
    @list.save

    redirect_to root_path
  end

  # def edit
  #   @list = List.find(params[:id])
  # end

  # def update
  #   @list = List.find(params[:id])
  #   @list.update(list_params)

  #   redirect_to list_path(@list.id)
  # end

  # def destroy
  #   @list = list.find(params[:id])
  #   @list.destroy

  #   redirect_to root_path
  # end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
