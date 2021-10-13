require "pg"

class Bookmark
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    rows = connection.exec("SELECT * FROM bookmarks")
    rows.map do |bookmark|
      { url: bookmark["url"] }
    end
  end
end
