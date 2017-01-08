class Object
  def format_as format
    Formatters::format_as self, format
  end
end

module Formatters

  def self.setup &block
    block.call self
  end

  def self.format_as object, format
    Base::format_as object, format
  end

  def self.define_format format, &format_code
    Base::define_format format, &format_code
  end

  class Base

    @@formats = {}

    def self.define_format format, &format_code
      @@formats[format] = format_code
    end

    def self.format_as object, format
      @@formats[format].call(object)
    end
  end

end
