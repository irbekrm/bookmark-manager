require 'pg'

module Mapper

  TABLES = { 'Bookmark' => 'bookmarks' }

  def self.all id
    connect_exec "SELECT * FROM #{TABLES[id.to_s]};"
  end

  def self.create params
    #params = escape params
    connect_exec "INSERT INTO #{TABLES[params[:klass].to_s]}(id,url, title) VALUES('#{params[:bookmark].id}','#{params[:bookmark].url}', '#{params[:bookmark].title}');"
  end

  def self.delete params
    connect_exec "DELETE FROM #{TABLES[params[:klass].to_s]} WHERE id LIKE '#{params[:id]}';"
  end

  def self.connect_exec statement
    conn = PG.connect(dbname: ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager')
    result = conn.exec statement
    conn.close
    result
  end

  def self.escape params
    params.keys.each { |key| params[key] = PG::Connection.escape_string(params[key]) }
  end
end
