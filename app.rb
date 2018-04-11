require 'sinatra/base'
require_relative './lib/bookmark.rb'

class BookmarksManager < Sinatra::Base
  set :sessions, true

  get '/' do
    erb :index, locals: { bookmarks: Bookmark.all }
  end

  run! if app_file == $0
end
