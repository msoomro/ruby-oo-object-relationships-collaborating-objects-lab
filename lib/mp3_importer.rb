class MP3Importer
    attr_accessor :path

    def initialize(file_path)
        @path = file_path
        files
    end

    def files
        r = Dir["#{path}/*.mp3"]
        r = r.collect do |file|
            file = file[path.length+1..-1]
        end
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
    end
end

test_music_path = "./spec/fixtures/mp3s"
music_importer = MP3Importer.new(test_music_path)