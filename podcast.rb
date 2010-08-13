class Podcast
  attr_reader :title, :url, :mp3
  def initialize(url, title, path)
    @url, @title, @path = url, title, path
    @mp3 = @path.split("/podcasts/")[1]
  end
  def to_s
    "#{@url};#{@title};#{@path};#{@mp3}"
  end
end
