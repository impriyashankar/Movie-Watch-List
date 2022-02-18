class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])


  end

  def create

    @list = List.find(params[:list_id])
    l_id = params[:list_id]
    m_id = params[:bookmark][:movie_id]
    @bookmark = Bookmark.new(comment: params[:bookmark][:comment], movie_id: m_id, list_id: l_id)
    #try to refactor here
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end

  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
    #modify here too
  end
end
