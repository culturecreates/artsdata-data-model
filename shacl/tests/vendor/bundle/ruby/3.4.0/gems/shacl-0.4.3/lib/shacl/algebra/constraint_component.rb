require_relative "operator"

module SHACL::Algebra
  ##
  # Constraint Components define basic constraint behaivor through _mandatory_ and _optional_ parameters. Constraints are accessed through their parameters.
  #
  class ConstraintComponent < Operator

    # Class Methods
    class << self
      ##
      # Creates an operator instance from a parsed SHACL representation.
      #
      # Special case for SPARQL ConstraintComponents.
      #
      # @param [Hash] operator
      # @param [Hash] options ({})
      # @option options [Hash{String => RDF::URI}] :prefixes
      # @return [Operator]
      def from_json(operator, **options)
        operands = []

        # Component is known by its subject IRI
        id = operator.fetch('id')

        # Component class (for instantiation) is based on the _local name_ of the component IRI
        class_name = ncname(id)

        parameters = operator.fetch('parameter', []).inject({}) do |memo, param|
          # Symbolize keys
          param = param.inject({}) {|memo, (k,v)| memo.merge(k.to_sym => v)}

          plc = ncname(param[:path])

          # Add class and local name
          param = param.merge(class: class_name, local_name: plc)
          memo.merge(param[:path] => param)
        end

        # Add parameters to operator lookup
        add_component(class_name, parameters)

        # Add parameter identifiers to operands
        operands << [:parameters, parameters.keys]

        # FIXME: labelTemplate

        validator = %w(validator nodeValidator propertyValidator).inject(nil) do |memo, p|
          memo || (SPARQLConstraintComponent.from_json(operator[p]) if operator.key?(p))
        end
        raise SHACL::Error, "Constraint Component has no validator" unless validator

        operands << [:validator, validator]

        new(*operands, **options)
      end

      # Extract the NCName tail of an IRI as a symbol.
      #
      # @param [RDF::URI] uri
      # @return [Symbol]
      def ncname(uri)
        uri.to_s.match(/(\w+)$/).to_s.to_sym
      end
    end
  end
end
