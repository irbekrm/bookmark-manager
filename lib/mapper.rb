require 'pg'

module Mapper

  TABLES = { 'Bookmark' => 'bookmarks', 'Comment' => 'comments' }

  def self.all id
    connect_exec "SELECT * FROM #{TABLES[id.to_s]};"
  end

  def self.create params
    #params = escape params
    connect_exec "INSERT INTO #{TABLES[params[:klass].to_s]}(id,url, title) VALUES('#{params[:bookmark].id}','#{params[:bookmark].url}', '#{params[:bookmark].title}');"
  end

  def self.delete params
    connect_exec "DELETE FROM comments WHERE bookmark_id LIKE '#{params[:id]}';"
    connect_exec "DELETE FROM #{TABLES[params[:klass].to_s]} WHERE id LIKE '#{params[:id]}';"
  end

  def self.update params
    connect_exec "UPDATE #{TABLES[params[:klass].to_s]} SET url='#{params['url']}', title='#{params['title']}' WHERE id LIKE '#{params['name']}';"
  end

  def self.add_comment params
    connect_exec "INSERT INTO #{TABLES['Comment']}(bookmark_id,text) VALUES('#{params['id']}', '#{params['comment']}');"
  end

  def self.comments
    connect_exec "SELECT * FROM comments;"
  end

  def self.find params
    connect_exec "SELECT * FROM #{TABLES[params[:klass].to_s]} WHERE id LIKE '#{params[:id]}';"
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
