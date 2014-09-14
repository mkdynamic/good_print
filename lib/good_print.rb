require "good_print/version"

module GoodPrint
  class << self
    GP_INDENT = 2

    def gp_puts(string, level, trailer = false, end_with_comma = false)
      prefix = trailer ? "" : " " * GP_INDENT * level
      suffix = end_with_comma ? "," : ""
      "#{prefix}#{string}#{suffix}\n"
    end

    def gp_print(string, level, trailer = false, end_with_comma = false)
      prefix = trailer ? "" : " " * GP_INDENT * level
      suffix = end_with_comma ? "," : ""
      "#{prefix}#{string}#{suffix}"
    end

    def gp(io, object, level = 0, trailer = false, end_with_comma = false)
      case object
      when Hash
        io << gp_puts("{", level, trailer)
        object.each_pair.each_with_index do |(k, v), idx|
          io << gp_print("#{k.inspect} => ", level + 1)
          gp io, v, level + 1, true, idx < object.size - 1
        end
        io << gp_puts("}", level, false, end_with_comma)
      when Enumerable
        prefix = if (defined? Set) && object.is_a?(Set)
          "<Set>"
        end
        io << gp_puts("#{prefix}[", level, trailer)
        object.each_with_index do |v, idx|
          gp io, v, level + 1, false, idx < object.size - 1
        end
        io << gp_puts("]", level, false, end_with_comma)
      else
        io << gp_puts("#{object.inspect}", level, trailer, end_with_comma)
      end

      nil
    end
  end
end

def gp(object)
  GoodPrint.gp(STDOUT, object)
end
