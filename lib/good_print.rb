require "good_print/version"

module GoodPrint
  class << self
    GP_INDENT = 2

    def gp_puts(string, level, trailer = false, end_with_comma = false)
      prefix = trailer ? "" : " " * GP_INDENT * level
      suffix = end_with_comma ? "," : ""
      puts "#{prefix}#{string}#{suffix}"
    end

    def gp_print(string, level, trailer = false, end_with_comma = false)
      prefix = trailer ? "" : " " * GP_INDENT * level
      suffix = end_with_comma ? "," : ""
      print "#{prefix}#{string}#{suffix}"
    end

    def gp(object, level = 0, trailer = false, end_with_comma = false)
      case object
      when Hash
        gp_puts "{", level, trailer
        object.each_pair.each_with_index do |(k, v), idx|
          gp_print "#{k.inspect} => ", level + 1
          gp v, level + 1, true, idx < object.size - 1
        end
        gp_puts "}", level, false, end_with_comma
      when Enumerable
        prefix = if (defined? Set) && object.is_a?(Set)
          "<Set>"
        end
        gp_puts "#{prefix}[", level, trailer
        object.each_with_index do |v, idx|
          gp v, level + 1, false, idx < object.size - 1
        end
        gp_puts "]", level, false, end_with_comma
      else
        gp_puts "#{object.inspect}", level, trailer, end_with_comma
      end
    end
  end
end

def gp(*args)
  GoodPrint.gp(*args)
end
