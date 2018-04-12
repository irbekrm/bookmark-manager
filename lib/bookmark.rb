require_relative 'mapper'

class Bookmark
  include Mapper

  attr_reader :title, :url, :id

  def initialize options={}
    @url = options['url']
    @title = options['title']
    @id = options['id'] ? options['id'] : random_id
  end

  def self.all
    (Mapper::all self).map{ |data| self.new data }
  end 

  def self.create params
      return nil unless valid_url? params['url']
      Mapper::create({bookmark: self.new(params), klass: self})
      true
  end

  def self.valid_url? url
    re = /https*\:\/\/[\w\.\-]{5,}\.[a-z]+/
    !!(url.match(re))
  end

  def self.delete id
    Mapper::delete({:id =>id, :klass => self})
  end
  
  def self.update params
    params[:klass] = self
    Mapper::update(params)
  end

  def random_id
    x = (Array.new(2) { Kernel.rand(97..122).chr } + Array.new(4) { Kernel.rand(0..9).to_s }).join''
  end
end
