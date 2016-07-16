module Minim
  module Validations
    REGISTERED = [:presence]

    def self.included(base)
      base.extend InstanceMethods
    end
  end
end
