require 'sinatra/base'
require_relative './lib/bookmark.rb'
require 'sinatra/flash'

class BookmarksManager < Sinatra::Base
  set :sessions, true
  register Sinatra::Flash

  get '/' do
    erb :index, locals: { bookmarks: Bookmark.all }
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    flash[:message] = 'ERROR: Invalid URL' unless Bookmark.create params
    redirect '/'
  end

  post '/delete' do
    Bookmark.delete params['name']
    redirect '/'
  end

  get '/update' do
    erb :update, locals: { name: params['name'] }
  end

  post '/update' do
    Bookmark.update params
    redirect '/'
  end 

  run! if app_file == $0
end
