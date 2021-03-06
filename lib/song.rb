class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) == true ? name : create_by_name(name)
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    name_array = name.split(" - ")
    name_array.collect! { |x| x.gsub(".mp3", "")}

    song = self.new
    song.artist_name = name_array[0]
    song.name = name_array[1]
    song
  end

  def self.create_from_filename(filename)
    name_array = filename.split(" - ")
    name_array.collect! { |x| x.gsub(".mp3", "")}

    song = self.create
    song.artist_name = name_array[0]
    song.name = name_array[1]
    song
  end

  def self.destroy_all
    all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
