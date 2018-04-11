def add_bookmarks
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec "INSERT INTO bookmarks(url, title,id) VALUES('http://makersacademy.com', 'Makers Academy', 'ab8934');"
  conn.exec "INSERT INTO bookmarks(url, title, id) VALUES('http://destroyallsoftware.com', 'Destroy All Software', 'df7634');"
  conn.exec "INSERT INTO bookmarks(url, title, id) VALUES('http://google.com', 'Google', 'aq1289');"
  conn.close
end
