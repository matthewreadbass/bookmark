require "pg"

class Bookmark
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    bookmarks = []
    rows = connection.exec("SELECT * FROM bookmarks")
    rows.each do |row|
      bookmarks << row["url"]
    end
    bookmarks
  end
end
