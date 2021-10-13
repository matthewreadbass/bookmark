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

  get "/add" do
    erb(:add)
  end

  post "/update" do
    Bookmark.create(params[:title], params[:url])
    redirect "/bookmarks"
  end
end
