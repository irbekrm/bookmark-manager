def add_bookmarks
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec "INSERT INTO bookmarks(url, title) VALUES('http://makersacademy.com', 'Makers Academy');"
  conn.exec "INSERT INTO bookmarks(url, title) VALUES('http://destroyallsoftware.com', 'Destroy All Software');"
  conn.exec "INSERT INTO bookmarks(url, title) VALUES('http://google.com', 'Google');"
  conn.close
end
