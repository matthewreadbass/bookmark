require "sinatra"
require "sinatra/reloader"
require "./lib/bookmark"

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Hello world!"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all

    erb(:bookmarks)
  end
end
