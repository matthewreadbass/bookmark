The website will have the following specification:

- Show a list of bookmarks
  As a user,
  so I can choose what to read,
  I would like to see a list of what I've bookmarked

| Objects  | Messages |
| -------- | -------- |
| Bookmark | read     |
| List     | display  |

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

Postgres installation: 

brew install postgresql
brew services start postgresql
psql postgres
CREATE DATABASE "bookmark_manager";
Connect to the database using \c bookmark_manager;
Run query from 01_create_bookmarks_table.sql
