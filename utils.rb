class String
  def to_full_width
    offset = 65248
    self.each_byte.collect { |x|
      if x == 10
        "\n"
      else
        [x == 32 ? 12288 : (x + offset)].pack("U").freeze
      end
    }.join("")
  end

  def pretty_split(len=140)
    output = []
    line = ""
    self.split(/\n/).each { |x|
      if ( (line + "\n" + x).size > 140 )
        puts "hit limit"
        output << line.dup
        line = ""
      end
      line << x << "\n"
    }
    output << line.dup
    output
  end
end