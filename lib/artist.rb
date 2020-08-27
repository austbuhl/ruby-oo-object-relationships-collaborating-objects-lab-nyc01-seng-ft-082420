
class Artist

    attr_accessor :name
    @@all =[]
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def add_song(song) # song in this case is a song instance
        song.artist = self
    end

    def songs
        Song.all.filter {|song| song.artist == self}
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end

    def self.find_or_create_by_name(name)
        query = @@all.find {|artist| artist.name == name}
        return query ? query:self.new(name)
        
        
        # return query
        # if query == self.new(name)  end
    
        # if self.all.include?(name)
        #     # self.name
        # else
        #     self.new(name)
        # end
    end

    

    def self.all
        @@all
    end

end
