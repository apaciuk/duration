require 'active_support/duration'
require 'active_support/core_ext/numeric/time'
require 'active_support/core_ext/integer/time'
require 'active_support/core_ext/time/calculations'
require 'active_support/core_ext/time/zones'
require 'active_support/core_ext/time/conversions'
require 'active_support/core_ext/time/acts_like'
require 'metasploit/concern'
require 'metasploit/model'
class Duration 
autoload :Error, 'error.rb'  
include Comparable
include Metasploit::Concern
include Metasploit::Model::Search::Operator

    def self.dump(value)
        return unless value
        value.to_i
    end

    def self.load(value)
        return unless value
        ActiveSupport::Duration.build(value)
    end

end 
