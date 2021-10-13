require "bookmark"

describe Bookmark do
  describe ".all" do
    it "returns all bookmarks" do
      described_class.create("Moog", "https://www.moogmusic.com/")
      expect(described_class.all).to include({ :title => "Moog", :url => "https://www.moogmusic.com/" })
    end
  end
  describe ".create" do
    it "adds a bookmark to a saved list of bookmarks" do
      described_class.create("Make Noise Music", "https://www.makenoisemusic.com/")
      expect(described_class.all).to include({ :title => "Make Noise Music", :url => "https://www.makenoisemusic.com/" })
    end
  end
end
