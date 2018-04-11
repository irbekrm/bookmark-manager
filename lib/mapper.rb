require 'pg'

module Mapper

  TABLES = { 'Bookmark' => 'bookmarks' }

  def self.all id
    connect_exec "SELECT * FROM #{TABLES[id.to_s]};"
  end

  def self.create params
    connect_exec "INSERT INTO #{TABLES[params[:id].to_s]}(url, title) VALUES('#{params[:bookmark].url}', '#{params[:bookmark].title}');"
  end

  def self.connect_exec statement
    conn = PG.connect(dbname: ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager')
    result = conn.exec statement
    conn.close
    result
  end
end
