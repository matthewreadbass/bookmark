require "pg"

feature "view bookmarks" do
  scenario "user will view all bookmarks saved" do
    connection = PG.connect(dbname: "bookmark_manager_test")
    connection.exec("INSERT INTO bookmarks VALUES(1, 'https://www.google.co.uk/');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.elsevier.com/en-gb');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.moogmusic.com/');")

    visit("/bookmarks")

    expect(page).to have_content("https://www.google.co.uk/")
    expect(page).to have_content("https://www.elsevier.com/en-gb")
    expect(page).to have_content("https://www.moogmusic.com/")
  end
end
