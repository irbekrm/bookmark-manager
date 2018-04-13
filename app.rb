require 'sinatra/base'
require_relative './lib/bookmark.rb'
require 'sinatra/flash'

class BookmarksManager < Sinatra::Base
  set :sessions, true
  register Sinatra::Flash

  get '/' do
    erb :index, locals: { bookmarks: Bookmark.all, comments: Bookmark.comments }
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

  get '/add_comment' do
    erb :comment, locals: { id: params['id'] }
  end

  post '/add_comment' do
    Bookmark.add_comment params
    redirect '/'
  end

  run! if app_file == $0
end
