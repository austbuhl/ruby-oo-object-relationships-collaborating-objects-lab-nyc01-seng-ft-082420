
class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    ## look into glob some more
    # glob( pattern, [flags], [base: path] ) → array

    def files
        array = path.length
        Dir.glob("#{path}/*.mp3").map {|songpath| songpath[array+1..-1] }
    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end


end