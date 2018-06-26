module Orbacle
  Position = Struct.new(:line, :character)
  PositionRange = Struct.new(:start, :end) do
    def include_position?(line, character)
      if (start_line+1..end_line-1).include?(line)
        true
      elsif start_line == line
        start_character <= character
      elsif end_line == line
        end_character >= character
      end
    end

    def end_line
      self.end.line
    end

    def start_line
      self.start.line
    end

    def start_character
      self.start.character
    end

    def end_character
      self.end.character
    end
  end
  class Location < Struct.new(:uri, :position_range, :span)
    def start
      position_range&.start
    end

    def start_line
      start&.line
    end

    def start_character
      start&.character
    end

    def end
      position_range&.end
    end

    def end_line
      self.end&.line
    end

    def end_character
      self.end&.character
    end
  end
end

require 'parser/current'

require 'orbacle/ast_utils'
require 'orbacle/builder/context'
require 'orbacle/builder/operator_assignment_processors'
require 'orbacle/builder'
require 'orbacle/const_name'
require 'orbacle/const_ref'
require 'orbacle/define_builtins'
require 'orbacle/engine'
require 'orbacle/global_tree'
require 'orbacle/graph'
require 'orbacle/indexer'
require 'orbacle/nesting'
require 'orbacle/node'
require 'orbacle/scope'
require 'orbacle/selfie'
require 'orbacle/some_utils'
require 'orbacle/typing_service.rb'
require 'orbacle/worklist'
