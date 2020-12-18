class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        file = filename.split(" - ")
        song = Song.new(file[1])
        song.artist_name = file[0]
        
        song
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end
end