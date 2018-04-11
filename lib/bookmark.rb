require_relative 'mapper'

class Bookmark
  include Mapper

  attr_reader :title, :url

  def initialize options={}
    @url = options['url']
    @title = options['title']
  end

  def self.all
    (Mapper::all self).map{ |data| self.new data }
  end 
end
