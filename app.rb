require 'sinatra/base'
require_relative './lib/bookmark.rb'

class BookmarksManager < Sinatra::Base
  set :sessions, true

  get '/' do
    erb :index, locals: { bookmarks: Bookmark.all }
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Bookmark.create params
    redirect '/'
  end

  run! if app_file == $0
end
