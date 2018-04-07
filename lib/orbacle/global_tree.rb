module Orbacle
  class GlobalTree
    class Method
      Nodes = Struct.new(:args, :result, :yields)

      class ArgumentsTree < Struct.new(:args, :kwargs, :blockarg)
        Regular = Struct.new(:name)
        Optional = Struct.new(:name)
        Splat = Struct.new(:name)
        Nested = Struct.new(:args)
      end

      def initialize(scope:, name:, position:, visibility:, args:, nodes:)
        raise ArgumentError.new(visibility) if ![:public, :private, :protected].include?(visibility)

        @name = name
        @position = position
        @visibility = visibility
        @args = args
        @nodes = nodes
        @scope = scope
      end

      attr_reader :name, :position, :scope, :args, :nodes
      attr_accessor :visibility
    end

    class Klass
      class Nodes
        def initialize(instance_variables = {}, class_level_instance_variables = {}, class_variables = {})
          @instance_variables = instance_variables
          @class_level_instance_variables = class_level_instance_variables
          @class_variables = class_variables
        end
        attr_accessor :instance_variables, :class_variables, :class_level_instance_variables
      end

      def initialize(name:, scope:, position:, inheritance_ref:, nodes: Nodes.new)
        @name = name
        @scope = scope
        @position = position
        @inheritance_ref = inheritance_ref
        @nodes = nodes
      end

      attr_reader :name, :scope, :position, :inheritance_ref, :nodes

      def ==(other)
        @name == other.name &&
          @scope == other.scope &&
          @inheritance_ref == other.inheritance_ref &&
          @position == position
      end

      def full_name
        [*scope.elems, @name].join("::")
      end
    end

    class Mod
      def initialize(name:, scope:, position:)
        @name = name
        @scope = scope
        @position = position
      end

      attr_reader :name, :scope, :position

      def ==(other)
        @name == other.name &&
          @scope == other.scope &&
          @position == position
      end

      def full_name
        [*scope.elems, @name].join("::")
      end
    end

    class Constant
      def initialize(name:, scope:, position:)
        @name = name
        @scope = scope
        @position = position
      end

      attr_reader :name, :scope, :position

      def ==(other)
        @name == other.name &&
          @scope == other.scope &&
          @position == position
      end

      def full_name
        [*scope.elems, @name].join("::")
      end
    end

    class Nodes
      def initialize(global_variables = {}, constants = {})
        @global_variables = global_variables
        @constants = constants
      end
      attr_accessor :global_variables, :constants
    end

    class Lambda
      Nodes = Struct.new(:args, :result)
      def initialize(id, nodes)
        @id = id
        @nodes = nodes
      end

      attr_reader :id, :nodes
    end

    def initialize
      @constants = []
      @metods = []
      @lambdas = []
      @nodes = Nodes.new
      @lambda_counter = 0
    end

    attr_reader :metods, :constants, :nodes

    def add_method(metod)
      @metods << metod
      return metod
    end

    def add_klass(klass)
      @constants << klass
      return klass
    end

    def add_mod(mod)
      @constants << mod
      return mod
    end

    def add_constant(constant)
      @constants << constant
      return constant
    end

    def add_lambda(nodes)
      lamb = Lambda.new(@lambda_counter, nodes)
      @lambda_counter += 1
      @lambdas << lamb
      return lamb
    end

    def solve_reference(const_ref)
      nesting = const_ref.nesting
      while !nesting.empty?
        scope = nesting.to_scope
        @constants.each do |constant|
          return constant if scope.increase_by_ref(const_ref).to_const_name == ConstName.from_string(constant.full_name)
        end
        nesting = nesting.decrease_nesting
      end
      @constants.find do |constant|
        const_ref.const_name == ConstName.from_string(constant.full_name)
      end
    end
  end
end
