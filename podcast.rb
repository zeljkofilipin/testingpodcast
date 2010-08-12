class Podcast
  def initialize(url, title, path)
    @url, @title, @path = url, title, path
  end
  def to_s
    "#{@url};#{@title};#{@path}"
  end
end
