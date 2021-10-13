require "pg"

feature "view bookmarks" do
  scenario "user can save a bookmark" do
    connection = PG.connect(dbname: "bookmark_manager_test")

    visit("/add")
    fill_in :url, with: "http://www.modulargrid.net"
    fill_in :title, with: "Modular Grid"
    click_button "Add"
    visit "/bookmarks"
    expect(page).to have_content("Modular Grid")
    expect(page).to have_content("http://www.modulargrid.net")
  end
end
