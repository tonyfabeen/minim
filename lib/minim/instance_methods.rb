module Minim
  module Exceptions
    class MissingAttributeError < StandardError; end
    class MissingValidationError < StandardError; end
  end

  module InstanceMethods
    def validates(*args)
      attributes = args.select { |att| att.kind_of?(Symbol) }
      validation = args.select { |att| att.kind_of?(Hash) }

      raise Exceptions::MissingAttributeError.new("At least one attribute must be passed") if attributes.empty?
      raise Exceptions::MissingValidationError.new("A validation must be passed") if validation.empty?

      attributes.each do |attribute|
        reader, writer = attribute, "#{attribute}=".to_sym

        unless self.instance_methods.include?(reader) || self.instance_methods.include?(reader)
          raise Exceptions::MissingAttributeError.new("Attribute '#{attribute}' not Found")
        end
      end
    end
  end
end

