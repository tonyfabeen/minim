module Minim
  module Model
    def self.included(base)
      base.extend InstanceMethods
    end
  end
end
