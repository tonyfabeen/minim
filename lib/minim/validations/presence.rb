module Minim
  module Validations
    class Presence
      attr_reader :errors

      def initialize(object_instance, attributes)
        @object_instance = object_instance
        @attributes      = attributes
        @errors          = {}
      end

      def validate
        @attributes.each do |attribute|
          value = @object_instance.send(attribute)

          if value.nil? || value.empty?
            @errors[attribute] = 'must be present'
          end
        end
      end
    end
  end
end
