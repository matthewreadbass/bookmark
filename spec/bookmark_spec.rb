require "bookmark"

describe Bookmark do
  describe "#all" do
    it "returns all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")

      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.google.co.uk/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.elsevier.com/en-gb');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.moogmusic.com/');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://www.google.co.uk/")
      expect(bookmarks).to include("https://www.elsevier.com/en-gb")
      expect(bookmarks).to include("https://www.moogmusic.com/")
    end
  end
end
