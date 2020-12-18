class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        artist = @@all.find {|a| a.name == name}
        artist = Artist.new(name) if artist == nil
        
        artist
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        self.songs.each {|song| puts "#{song.name}\n"}
    end

end