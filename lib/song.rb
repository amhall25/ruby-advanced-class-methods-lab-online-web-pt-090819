class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end   
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song= self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
    
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  def self.all
    @@all
  end

  def self.new_from_filename(file)
  file2=file.split(" - ")
  artist =file2[0]
  song_name =(file2[1].split(".")[0])
  song = self.create_by_name(song_name)
  song.artist_name=artist
  song
  end
  
  def self.create_from_filename(song)
    self.new_from_filename(song)
    
  end

  def save
    self.class.all << self
  end
  
  def self.destroy_all
    @@all=[]
  end


end
