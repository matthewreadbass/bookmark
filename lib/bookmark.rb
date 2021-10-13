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
      { title: bookmark["title"], url: bookmark["url"] }
    end
  end
  def self.create(title, url)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}')")
  end
end
