class Brainfuck
    def initialize(file)
        @ram = File.open(file).read.each_char.map.to_a
        @eoc = @ram.size
        @ram.fill(0, @eoc..256)
        @p = @eoc
        @pp = 0
    end

    def run
        case @ram[@pp]
        when '.' ; putc @ram[@p]
        when ',' ; @ram[@p] = stdin.readchar
        when '+' ; @ram[@p] += 1
        when '-' ; @ram[@p] -= 1
        when '>' ; @p += 1
        when '<' ; @p -= 1
        when '[' 
            if @ram[@p] == 0
                while @ram[@pp] != ']'
                    @pp += 1
                end
            end
        when ']'
            if @ram[@p] != 0
                while @ram[@pp] != '['
                    @pp -= 1
                end
            end
        else
        end
        @pp += 1
    end

    def start
        while @pp <= @eoc
            self.run
        end
    end
end

# Select to execute file.
vf = Brainfuck.new("./helloworld.bf")
vf.start