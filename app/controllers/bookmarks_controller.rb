class BookmarksController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @bookmark = @group.bookmarks.build
  end

  def create
    @group = Group.find(params[:group_id])
    bookmark = @group.bookmarks.create(bookmark_params)

    FetchFaviconJob.perform_later(bookmark)

    redirect_to root_path, status: 303
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to root_path, status: 303
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:label, :url, :group_id)
  end
end
