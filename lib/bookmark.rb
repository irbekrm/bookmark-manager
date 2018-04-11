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

  def self.create params
      return nil unless valid_url? params['url']
      Mapper::create({bookmark: self.new(params), id: self})
      true
  end

  def self.valid_url? url
    re = /https*\:\/\/[\w\.\-]{5,}\.[a-z]+/
    !!(url.match(re))
  end
end
