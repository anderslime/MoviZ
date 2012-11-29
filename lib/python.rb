module Python
  require "python/configuration"

  class << self
    def import (package)
      python_package = RubyPython.import(package)
    end

    def terminate
      RubyPython.stop
    end
    alias_method :stop, :terminate
  end
end
