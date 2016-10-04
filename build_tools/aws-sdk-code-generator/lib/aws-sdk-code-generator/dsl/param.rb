module AwsSdkCodeGenerator
  module Dsl
    class Param

      def initialize(name, type:nil, default:nil, docstring:nil, documented: true)
        @name = name.to_s
        @type = TagType.new(type)
        @default = TagDefault.new(default)
        @docstring = TagDocstring.new(docstring)
        @documented = documented
      end

      attr_reader :name, :default

      def documented?
        !!@documented
      end

      def tag
        if [@type, @default, @docstring].all?(&:empty?)
          []
        else
          [first_line] + @docstring.lines
        end
      end

      private

      def first_line
        "# @param#{@type} #{@name}#{yard_default}"
      end

      def yard_default
        @default.empty? ? '' : " (#{@default})"
      end

    end
  end
end